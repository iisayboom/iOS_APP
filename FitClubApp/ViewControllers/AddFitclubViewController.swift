//
//  AddFitclubViewController.swift
//  FitClubApp
//
//  Created by Niels De bruyne on 25/11/2017.
//  Copyright © 2017 Niels De bruyne. All rights reserved.
//

import UIKit
import RealmSwift

class AddFitclubViewController: UIViewController,UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var txtNaamFitClub: UITextField!
    @IBOutlet weak var pickerViewOef1: UIPickerView!
    @IBOutlet weak var pickerViewOef2: UIPickerView!
    @IBOutlet weak var pickerViewOef3: UIPickerView!
    @IBOutlet weak var btnNext: UIBarButtonItem!
    
    let realm = try! Realm()
    var fitclubNaam: String?
    var exercise1: Oefening?
    var exercise2: Oefening?
    var exercise3: Oefening?
    
    //var muscles: [Spiergroep]? = []
    //var exercises: [Oefening]? = []

    override func viewDidLoad() {
        super.viewDidLoad()

        exercise1 = realm.objects(Spiergroep.self)[0].oefeningen[0]
        exercise2 = realm.objects(Spiergroep.self)[1].oefeningen[0]
        exercise3 = realm.objects(Spiergroep.self)[2].oefeningen[0]
        print(exercise1!)
        print(exercise2!)
        print(exercise3!)

        print("done")
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var rowCount : Int = (realm.objects(Spiergroep.self)[0].oefeningen.count)
        
        if pickerView == pickerViewOef2 {
            rowCount = (realm.objects(Spiergroep.self)[1].oefeningen.count)
        } else if pickerView == pickerViewOef3 {
            rowCount = (realm.objects(Spiergroep.self)[2].oefeningen.count)
        }
        
        return rowCount;
    }

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerViewOef1 {
            return realm.objects(Spiergroep.self)[0].oefeningen[row].naam
        } else if pickerView == pickerViewOef2 {
            return realm.objects(Spiergroep.self)[1].oefeningen[row].naam
        } else if pickerView == pickerViewOef3 {
            return realm.objects(Spiergroep.self)[2].oefeningen[row].naam
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerViewOef1 {
            exercise1 = realm.objects(Spiergroep.self)[0].oefeningen[row]
        } else if pickerView == pickerViewOef2 {
            exercise2 = realm.objects(Spiergroep.self)[1].oefeningen[row]
        } else if pickerView == pickerViewOef3 {
            exercise3 = realm.objects(Spiergroep.self)[2].oefeningen[row]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func goToBlok2(_ sender: Any) {
        if txtNaamFitClub.text != nil && txtNaamFitClub.text != "" && exercise1 != nil && exercise2 != nil && exercise3 != nil {
            performSegue(withIdentifier: "showPart2", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPart2" {
            print(exercise1!)
            print(exercise2!)
            print(exercise3!)
            let fc = Fitclub(naam: txtNaamFitClub.text!)
            fc.blokken.append(Blok(id: "1"))
            fc.blokken[0].oefeningen.append(exercise1!)
            fc.blokken[0].oefeningen.append(exercise2!)
            fc.blokken[0].oefeningen.append(exercise3!)
            print(fc.blokken)
            
            
            
            let secondController = segue.destination as! AddFitclubViewControllerBlok2
            secondController.fitclub = fc
        }
    }
    
    
    
    
    
}
