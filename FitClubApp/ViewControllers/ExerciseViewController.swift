//
//  MuscleViewController.swift
//  FitClubApp
//
//  Created by Niels De bruyne on 23/11/2017.
//  Copyright © 2017 Niels De bruyne. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController {
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtDescription: UILabel!
    @IBOutlet weak var imgExercise: UIImageView!
    
    var exercise: Oefening?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtTitle.text = exercise?.naam
        txtDescription.text = exercise?.oefeningDescription
        let url = URL(string: (exercise?.image)!)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.imgExercise.image = UIImage(data: data!)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
