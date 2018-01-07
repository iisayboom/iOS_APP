//
//  QrCodeViewController.swift
//  FitClubApp
//
//  Created by Niels De bruyne on 07/01/2018.
//  Copyright © 2018 Niels De bruyne. All rights reserved.
//

import UIKit

class QrCodeShowViewController: UIViewController {
    
    var muscle : UIImage!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = muscle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
