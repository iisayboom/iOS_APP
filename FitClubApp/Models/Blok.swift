//
//  Blok.swift
//  FitClubApp
//
//  Created by Niels De bruyne on 01/12/2017.
//  Copyright © 2017 Niels De bruyne. All rights reserved.
//

import Foundation
import RealmSwift

class Blok : Object {
    @objc dynamic var id : String? = ""
    let oefeningen = List<Oefening>()
    
    convenience required init(id: String) {
        self.init()
        self.id = id
    }
}
