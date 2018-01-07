//
//  Spiergroep.swift
//  FitClubApplication
//
//  Created by Niels De bruyne on 20/11/2017.
//  Copyright © 2017 Niels De bruyne. All rights reserved.
//

import Foundation
import RealmSwift

class Spiergroep : Object {
    @objc dynamic var naam: String = ""
    let oefeningen = List<Oefening>()
    
    convenience init(naam:String) {
        self.init()
        self.naam = naam
    }
}
