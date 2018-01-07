//
//  Fitclub.swift
//  FitClubApp
//
//  Created by Niels De bruyne on 22/11/2017.
//  Copyright © 2017 Niels De bruyne. All rights reserved.
//

import Foundation
import RealmSwift

class Fitclub : Object {
    @objc dynamic var naam:String = ""
    let blokken = List<Blok>()
    
    convenience init(naam:String) {
        self.init()
        self.naam = naam
    }
}
