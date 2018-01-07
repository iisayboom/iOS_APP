//
//  MuscleTableViewController.swift
//  FitClubApp
//
//  Created by Niels De bruyne on 23/11/2017.
//  Copyright © 2017 Niels De bruyne. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftQRCode

var myPos = 0

class MuscleTableViewController: UITableViewController {
    
    let realm = try! Realm()
    let searchController = UISearchController(searchResultsController: nil)
    
    var muscle: Spiergroep?
    var filteredMuscles = [Spiergroep]()
    var selectedMuscle: String!
    var code: UIImage!
    var searchActive : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Spier name"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return 1
        }
        
        return realm.objects(Spiergroep.self).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "muscleCel", for: indexPath)
        
        let muscle: Spiergroep
        if isFiltering() {
            muscle = filteredMuscles[indexPath.row]
        } else {
            muscle = realm.objects(Spiergroep.self)[indexPath.row]
        }
        cell.textLabel!.text = muscle.naam
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if isFiltering() {
            self.selectedMuscle = filteredMuscles[indexPath.row].naam
        } else {
            self.selectedMuscle = (realm.objects(Spiergroep.self)[indexPath.row].naam)
        }
        
        let alert = UIAlertController(title: "QR CODE", message: "Do you want to make a qr code to share your chosen muscle?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { action in
            self.showQrCode()
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showqrcode" {
            let secondController = segue.destination as! QrCodeShowViewController
            secondController.muscle = self.code
        }
    }

    @IBAction func unwindFromTerugnaarOverzichtSegue(_ segue: UIStoryboardSegue) {
        guard segue.identifier == "showAllMuscles" else {
            fatalError("Unknown segue")
        }
        let addMuscleController = segue.source as! AddMuscleViewController
        
        //dataRepo.spiergroepen.append(addMuscleController.spier!)
        try! realm.write {
            realm.add(addMuscleController.muscle!)
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
        filteredMuscles = (realm.objects(Spiergroep.self).filter({( muscle : Spiergroep) -> Bool in
            return muscle.naam.lowercased().contains(searchText.lowercased())
        }))
        
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func showQrCode() {
        // generate qrcode
        self.code = QRCode.generateImage(self.selectedMuscle, avatarImage: UIImage(named: "avatar"), avatarScale: 0.3)
        performSegue(withIdentifier: "showqrcode", sender: self)
    }
}

extension MuscleTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
