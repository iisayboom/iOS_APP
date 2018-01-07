//
//  AddFitclubViewControllerBlok2.swift
//  FitClubApp
//
//  Created by Niels De bruyne on 03/01/2018.
//  Copyright © 2018 Niels De bruyne. All rights reserved.
//

import UIKit
import RealmSwift

class AddFitclubViewControllerBlok2: UIViewController,UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    
    @IBOutlet weak var pickerview1: UIPickerView!
    @IBOutlet weak var pickerview2: UIPickerView!
    @IBOutlet weak var pickerview3: UIPickerView!
    @IBOutlet weak var btnNext: UIBarButtonItem!
    
    let realm = try! Realm()
    
    var exercise1: Oefening?
    var exercise2: Oefening?
    var exercise3: Oefening?
    var fitclub : Fitclub?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        exercise1 = realm.objects(Spiergroep.self)[0].oefeningen[0]
        exercise2 = realm.objects(Spiergroep.self)[1].oefeningen[0]
        exercise3 = realm.objects(Spiergroep.self)[2].oefeningen[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var rowCount : Int = (realm.objects(Spiergroep.self)[0].oefeningen.count)
        
        if pickerView == pickerview2 {
            rowCount = (realm.objects(Spiergroep.self)[1].oefeningen.count)
        } else if pickerView == pickerview3 {
            rowCount = (realm.objects(Spiergroep.self)[2].oefeningen.count)
        }
        return rowCount;
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerview1 {
            return realm.objects(Spiergroep.self)[0].oefeningen[row].naam
        } else if pickerView == pickerview2 {
            return realm.objects(Spiergroep.self)[1].oefeningen[row].naam
        } else if pickerView == pickerview3 {
            return realm.objects(Spiergroep.self)[2].oefeningen[row].naam
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerview1 {
            exercise1 = realm.objects(Spiergroep.self)[0].oefeningen[row]
        } else if pickerView == pickerview2 {
            exercise2 = realm.objects(Spiergroep.self)[1].oefeningen[row]
        } else if pickerView == pickerview3 {
            exercise3 = realm.objects(Spiergroep.self)[2].oefeningen[row]
        }
    }
    
    @IBAction func goToBlok3(_ sender: Any) {
        if exercise1 != nil && exercise2 != nil && exercise3 != nil {
            performSegue(withIdentifier: "showPart3", sender: self)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPart3" {
            print(exercise1!)
            print(exercise2!)
            print(exercise3!)
            
            self.fitclub?.blokken.append(Blok(id: "2"))
            self.fitclub?.blokken[1].oefeningen.append(exercise1!)
            self.fitclub?.blokken[1].oefeningen.append(exercise2!)
            self.fitclub?.blokken[1].oefeningen.append(exercise3!)
            
            let secondController = segue.destination as! AddFitclubViewControllerBlok3
            secondController.fitclub = self.fitclub
        }
    }

}
