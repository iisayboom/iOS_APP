//
//  Oefening.swift
//  FitClubApplication
//
//  Created by Niels De bruyne on 20/11/2017.
//  Copyright © 2017 Niels De bruyne. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Oefening : Object, Codable {
    @objc dynamic var naam : String = ""
    @objc dynamic var aantal : String? = ""
    @objc dynamic var oefeningDescription : String = ""
    @objc dynamic var image: String = ""
    
    convenience init(naam : String, aantal : String?, oefeningDescription : String, image: String) {
        self.init()
        self.naam = naam
        self.aantal = aantal
        self.oefeningDescription = oefeningDescription
        self.image = image
    }
 
}
