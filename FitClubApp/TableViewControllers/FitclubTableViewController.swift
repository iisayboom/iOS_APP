//
//  TableViewController2.swift
//  FitClubApp
//
//  Created by Niels De bruyne on 23/11/2017.
//  Copyright © 2017 Niels De bruyne. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftQRCode
import AVFoundation

var dataRepo: DataRepo = DataRepo()

var myIndex = 0

class FitclubTableViewController: UITableViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    let realm = try! Realm()
    let searchController = UISearchController(searchResultsController: nil)
    
    var fitclub: Fitclub?
    var filteredFitclubs = [Fitclub]()
    var video = AVCaptureVideoPreviewLayer()
    var searchActive : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Fitclub"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredFitclubs.count
        }
        
        return realm.objects(Fitclub.self).count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fitclubCell", for: indexPath)
        let fitclub: Fitclub
        if isFiltering() {
            fitclub = filteredFitclubs[indexPath.row]
        } else {
            fitclub = (realm.objects(Fitclub.self)[indexPath.row])
        }
        cell.textLabel!.text = fitclub.naam
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if isFiltering() {
            self.fitclub = filteredFitclubs[indexPath.row]
        } else {
            self.fitclub = (realm.objects(Fitclub.self)[indexPath.row])
        }
        
        performSegue(withIdentifier: "showFitclubPart1", sender: self)
    }
    
    func heeftMinimumEenOefeningVoorElkeSpiergroep() -> Bool {
        
        if realm.objects(Spiergroep.self).count >= 3 && realm.objects(Spiergroep.self)[0].oefeningen.count >= 1 && realm.objects(Spiergroep.self)[1].oefeningen.count >= 1 && realm.objects(Spiergroep.self)[2].oefeningen.count >= 1 {
            return true
        }
        
        return false
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "addExercise" && heeftMinimumEenOefeningVoorElkeSpiergroep() {
            return true
        }
        
        return false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFitclubPart1" {
            let secondController = segue.destination as! TableViewController1stBlok
            secondController.fitclub = self.fitclub
        }
    }
    
    @IBAction func unwindFromAddFitclubSegue(_ segue: UIStoryboardSegue) {
        guard segue.identifier == "showAllFitclubs" else {
            fatalError("Unknown segue")
        }
        let addFitclubController = segue.source as! AddFitclubViewControllerBlok3
        let fitclub = addFitclubController.fitclub
        
        //dataRepo.fitclubs.append(fitclub!)
        try! realm.write {
            realm.add(fitclub!)
        }
        tableView.reloadData()
    }
    
    @IBAction func unwindFromViewFitclub(_ segue: UIStoryboardSegue) {
        guard segue.identifier == "goBackToAllFitclubs" else {
            fatalError("Unknown segue")
        }
        tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredFitclubs = (realm.objects(Fitclub.self).filter({( fitclub : Fitclub) -> Bool in
            return fitclub.naam.lowercased().contains(searchText.lowercased())
        }))
        
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        /*
        try! realm.write {
            realm.deleteAll()
        }
        */
        tableView.reloadData()
    }

}

extension FitclubTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
