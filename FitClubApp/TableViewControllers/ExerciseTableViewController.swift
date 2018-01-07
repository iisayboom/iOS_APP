//
//  MuscleTableViewController.swift
//  FitClubApp
//
//  Created by Niels De bruyne on 23/11/2017.
//  Copyright © 2017 Niels De bruyne. All rights reserved.
//

import UIKit
import RealmSwift

var myMuscleIndex = 0

class ExerciseTableViewController: UITableViewController {
    
    let realm = try! Realm()
    let searchController = UISearchController(searchResultsController: nil)
    var exercise: Oefening?
    var filteredExercises = [Oefening]()
    
    var searchActive : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Exercise"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredExercises.count
        }
        
        return realm.objects(Oefening.self).count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath)
        let exercise: Oefening
        
        if isFiltering() {
            exercise = filteredExercises[indexPath.row]
        } else {
            exercise = realm.objects(Oefening.self)[indexPath.row]
        }
        cell.textLabel!.text = exercise.naam
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if isFiltering() {
            self.exercise = filteredExercises[indexPath.row]
        } else {
            let exercise = realm.objects(Oefening.self)[indexPath.row]
            self.exercise = exercise
        }
        
        performSegue(withIdentifier: "showExercise", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showExercise" {
            let secondController = segue.destination as! ExerciseViewController
            
            secondController.exercise = self.exercise
        }
    }
    
    @IBAction func unwindFromAddExerciseSegue(_ segue: UIStoryboardSegue) {
        guard segue.identifier == "showAllExercises" else {
            fatalError("Unknown segue")
        }
        
        let addExerciseController = segue.source as! AddExcerciseController
        let muscle = addExerciseController.muscle
        let exercise = addExerciseController.exercise!
        
        for (index,spier) in realm.objects(Spiergroep.self).enumerated() {
            if spier.naam.lowercased() == muscle?.lowercased() {
                try! realm.write {
                    realm.objects(Spiergroep.self)[index].oefeningen.append(exercise)
                }
            }
        }
        
        try! realm.write {
            realm.add(exercise)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredExercises = (realm.objects(Oefening.self).filter({( exercise : Oefening) -> Bool in
            return exercise.naam.lowercased().contains(searchText.lowercased())
        }))
        
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}

extension ExerciseTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
