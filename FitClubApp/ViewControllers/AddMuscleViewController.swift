//
//  AddMuscleViewController.swift
//  FitClubApp
//
//  Created by Niels De bruyne on 26/12/2017.
//  Copyright © 2017 Niels De bruyne. All rights reserved.
//

import UIKit

class AddMuscleViewController: UIViewController {

    @IBOutlet weak var txtSpier: UITextField!
    
    var muscle: Spiergroep?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let muscle = txtSpier.text
        
        self.muscle = Spiergroep(naam: muscle!)
    }
    
    @IBAction func addMuslce() {
        if txtSpier.text != nil {
            performSegue(withIdentifier: "terugnaarOverzicht", sender: self)
        }
        
    }

}
