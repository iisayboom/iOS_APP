//
//  DataRepo.swift
//  FitClubApp
//
//  Created by Niels De bruyne on 23/11/2017.
//  Copyright © 2017 Niels De bruyne. All rights reserved.
//

import Foundation
import UIKit

class DataRepo {
    var oefeningen = [Oefening]()
    var spiergroepen = [Spiergroep]()
    var fitclubs = [Fitclub]()
    
    init() {
    }
        /*
        oefeningen.append(
         Oefening(naam : "Pompen",aantal : "20 keer",oefeningDescription : "Just aaaaaaaaa weeeeeee cieeeeee wooooooooop", image: UIImage(named:"Pompen.jpg")!)
        )
        
        oefeningen.append(
            Oefening(naam: "Sit Up",aantal : "40 keer",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"SitUp.jpg")!)
        )
        
        spiergroepen.append(
            Spiergroep(naam: "Armen", oefeningen:[
                Oefening(naam : "Pompen1",aantal : "20 keer",description : "Just aaaaaaaaa weeeeeee cieeeeee wooooooooop", image: UIImage(named:"Pompen.jpg")!),
                Oefening(naam : "Pompen2",aantal : "20 keer",description : "Just aaaaaaaaa weeeeeee cieeeeee wooooooooop", image: UIImage(named:"Pompen.jpg")!),
                Oefening(naam : "Pompen3",aantal : "20 keer",description : "Just aaaaaaaaa weeeeeee cieeeeee wooooooooop", image: UIImage(named:"Pompen.jpg")!),
                Oefening(naam : "Pompen4",aantal : "20 keer",description : "Just aaaaaaaaa weeeeeee cieeeeee wooooooooop", image: UIImage(named:"Pompen.jpg")!)
                ])
        )
        
        spiergroepen.append(
            Spiergroep(naam: "Buik", oefeningen:[
                Oefening(naam: "Sit Up1",aantal : "40 keer",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"SitUp.jpg")!),
                Oefening(naam: "Sit Up2",aantal : "40 keer",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"SitUp.jpg")!),
                Oefening(naam: "Sit Up3",aantal : "40 keer",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"SitUp.jpg")!),
                Oefening(naam: "Sit Up4",aantal : "40 keer",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"SitUp.jpg")!)
                ])
        )
        
        spiergroepen.append(
            Spiergroep(naam: "Benen", oefeningen:[
                Oefening(naam: "Squad1",aantal : "40 keer",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"SitUp.jpg")!),
                Oefening(naam: "Squad1",aantal : "40 keer",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"SitUp.jpg")!),
                Oefening(naam: "Squad1",aantal : "40 keer",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"SitUp.jpg")!),
                Oefening(naam: "Squad1",aantal : "40 keer",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"SitUp.jpg")!)
                ])
        )
        
        
        fitclubs.append(
            
            Fitclub(
                naam: "Fitclub 1",
                blokken: [
                    Blok(
                        oefeningen:[
                            Oefening(naam: "Pompen", aantal:"20 keer",description : "Just aaaaaaaaa weeeeeee cieeeeee wooooooooop", image: UIImage(named:"Pompen.jpg")!),
                            Oefening(naam: "Squad", aantal:"20 Gezamelijk",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"Squad")!),
                            Oefening(naam: "Jumping Jacks", aantal:"30 keer",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"JumpingJacks.jpg")!)]),
                    Blok(
                        oefeningen:[
                            Oefening(naam: "Sit Up", aantal:"40 keer",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"SitUp.jpg")!),
                            Oefening(naam: "Jumping Jacks", aantal:"30 keer",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"JumpingJacks.jpg")!),
                            Oefening(naam: "Benen Gooien", aantal:"Maximum Aantal",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"BenenGooien.jpg")!)]),
                    Blok(
                        oefeningen:[
                            Oefening(naam: "Wall Sit", aantal:"1 minuut",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"SitUp.jpg")!),
                            Oefening(naam: "Pompen op 1 hand", aantal:"30 keer",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"JumpingJacks.jpg")!),
                            Oefening(naam: "Dubbele salto", aantal:"Maximum Aantal",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"BenenGooien.jpg")!)])
                ])
        )
        
        fitclubs.append(
        
            Fitclub(
                naam: "Fitclub 2",
                blokken: [
                    Blok(
                        oefeningen:[
                            Oefening(naam: "Sit Up", aantal:"40 keer",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"SitUp.jpg")!),
                            Oefening(naam: "Jumping Jacks", aantal:"30 keer",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"JumpingJacks.jpg")!),
                            Oefening(naam: "Benen Gooien", aantal:"Maximum Aantal",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"BenenGooien.jpg")!)]),
                    Blok(
                        oefeningen:[
                            Oefening(naam: "Wall Sit", aantal:"1 minuut",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"SitUp.jpg")!),
                            Oefening(naam: "Pompen op 1 hand", aantal:"30 keer",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"JumpingJacks.jpg")!),
                            Oefening(naam: "Dubbele salto", aantal:"Maximum Aantal",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"BenenGooien.jpg")!)]),
                    Blok(
                        oefeningen:[
                            Oefening(naam: "Pompen", aantal:"20 keer",description : "Just aaaaaaaaa weeeeeee cieeeeee wooooooooop", image: UIImage(named:"Pompen.jpg")!),
                            Oefening(naam: "Squad", aantal:"20 Gezamelijk",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"Squad")!),
                            Oefening(naam: "Jumping Jacks", aantal:"30 keer",description : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named:"JumpingJacks.jpg")!)])
                          
                ])
        )
    
    }
    
    func addOefening(_oefening: String, _description: String, _image: UIImage) {
        oefeningen.append(Oefening(naam: _oefening, aantal: "5", description: _description, image: _image))
    }
    
    
    
    
     init() {
     oefeningen.append(
        Oefening(naam : "Pompen",aantal : "20 keer", oefeningDescription : "Just aaaaaaaaa weeeeeee cieeeeee wooooooooop", image: UIImage(named: "Pompen.jpg")!)
     )
     
     oefeningen.append(
        Oefening(naam: "Sit Up1",aantal : "40 keer", oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "SitUp.jpg")!)
     )
    
        
        let oefening = Oefening(naam : "Pompen1", aantal : "20 keer", oefeningDescription : "Just aaaaaaaaa weeeeeee cieeeeee wooooooooop", image: UIImage(named: "Pompen.jpg")!)
        let oefening2 = Oefening(naam : "Pompen2", aantal : "20 keer", oefeningDescription : "Just aaaaaaaaa weeeeeee cieeeeee wooooooooop", image: UIImage(named: "Pompen.jpg")!)
        let oefening3 = Oefening(naam : "Pompen3", aantal : "20 keer", oefeningDescription : "Just aaaaaaaaa weeeeeee cieeeeee wooooooooop", image: UIImage(named: "Pompen.jpg")!)
        let oefening4 = Oefening(naam : "Pompen4", aantal : "20 keer", oefeningDescription : "Just aaaaaaaaa weeeeeee cieeeeee wooooooooop", image: UIImage(named: "Pompen.jpg")!)
        
        let spiergroep = Spiergroep(naam: "Armen")
        spiergroep.oefeningen.append(oefening)
        spiergroep.oefeningen.append(oefening2)
        spiergroep.oefeningen.append(oefening3)
        spiergroep.oefeningen.append(oefening4)
        
        spiergroepen.append(spiergroep)

     
        let oefening5 = Oefening(naam: "Sit Up1",aantal : "40 keer",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "SitUp.jpg")!)
        let oefening6 = Oefening(naam: "Sit Up2",aantal : "40 keer",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "SitUp.jpg")!)
        let oefening7 = Oefening(naam: "Sit Up3",aantal : "40 keer",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "SitUp.jpg")!)
        let oefening8 = Oefening(naam: "Sit Up4",aantal : "40 keer",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "SitUp.jpg")!)
        
        let spiergroep2 = Spiergroep(naam: "Buik")
        spiergroep2.oefeningen.append(oefening5)
        spiergroep2.oefeningen.append(oefening6)
        spiergroep2.oefeningen.append(oefening7)
        spiergroep2.oefeningen.append(oefening8)
        
        spiergroepen.append(spiergroep2)
        
    
        let oefening9 = Oefening(naam: "Squad1",aantal : "40 keer",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "SitUp.jpg")!)
        let oefening10 = Oefening(naam: "Squad1",aantal : "40 keer",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "SitUp.jpg")!)
        let oefening11 = Oefening(naam: "Squad1",aantal : "40 keer",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "SitUp.jpg")!)
        let oefening12 = Oefening(naam: "Squad1",aantal : "40 keer",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "SitUp.jpg")!)
        
        let spiergroep3 = Spiergroep(naam: "Benen")
        spiergroep3.oefeningen.append(oefening9)
        spiergroep3.oefeningen.append(oefening10)
        spiergroep3.oefeningen.append(oefening11)
        spiergroep3.oefeningen.append(oefening12)
        
        spiergroepen.append(spiergroep3)
     
     

        let oef1 = Oefening(naam: "Pompen", aantal:"20 keer",oefeningDescription : "Just aaaaaaaaa weeeeeee cieeeeee wooooooooop", image: UIImage(named: "Pompen.jpg")!)
        let oef2 = Oefening(naam: "Squad", aantal:"20 Gezamelijk",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "Squad")!)
        let oef3 = Oefening(naam: "Jumping Jacks", aantal:"30 keer",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "JumpingJacks.jpg")!)
     
        let oef4 = Oefening(naam: "Sit Up", aantal:"40 keer",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "SitUp.jpg")!)
        let oef5 = Oefening(naam: "Jumping Jacks", aantal:"30 keer",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "JumpingJacks.jpg")!)
        let oef6 = Oefening(naam: "Benen Gooien", aantal:"Maximum Aantal",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "BenenGooien.jpg")!)
     
        let oef7 = Oefening(naam: "Wall Sit", aantal:"1 minuut",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "SitUp.jpg")!)
        let oef8 = Oefening(naam: "Pompen op 1 hand", aantal:"30 keer",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "JumpingJacks.jpg")!)
        let oef9 = Oefening(naam: "Dubbele salto", aantal:"Maximum Aantal",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "BenenGooien.jpg")!)
        
        let fitclub1 = Fitclub(naam: "Fitclub 1")
        let blok1 = Blok()
        blok1.oefeningen.append(oef1)
        blok1.oefeningen.append(oef2)
        blok1.oefeningen.append(oef3)
        
        let blok2 = Blok()
        blok2.oefeningen.append(oef4)
        blok2.oefeningen.append(oef5)
        blok2.oefeningen.append(oef6)
        
        let blok3 = Blok()
        blok3.oefeningen.append(oef7)
        blok3.oefeningen.append(oef8)
        blok3.oefeningen.append(oef9)
        
        fitclub1.blokken.append(blok1)
        fitclub1.blokken.append(blok2)
        fitclub1.blokken.append(blok3)
        
        fitclubs.append(fitclub1)
        
     
     
        let oef10 = Oefening(naam: "Sit Up", aantal:"40 keer",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "SitUp.jpg")!)
        let oef11 = Oefening(naam: "Jumping Jacks", aantal:"30 keer",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "JumpingJacks.jpg")!)
        let oef12 = Oefening(naam: "Benen Gooien", aantal:"Maximum Aantal",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "BenenGooien.jpg")!)

        let oef13 = Oefening(naam: "Wall Sit", aantal:"1 minuut",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "SitUp.jpg")!)
        let oef14 = Oefening(naam: "Pompen op 1 hand", aantal:"30 keer",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "JumpingJacks.jpg")!)
        let oef15 = Oefening(naam: "Dubbele salto", aantal:"Maximum Aantal",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "BenenGooien.jpg")!)

        let oef16 = Oefening(naam: "Pompen", aantal:"20 keer",oefeningDescription : "Just aaaaaaaaa weeeeeee cieeeeee wooooooooop", image: UIImage(named: "Pompen.jpg")!)
        let oef17 = Oefening(naam: "Squad", aantal:"20 Gezamelijk",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "Squad")!)
        let oef18 = Oefening(naam: "Jumping Jacks", aantal:"30 keer",oefeningDescription : "Pezeeeeeeeweeeee poooowoooodoooleee", image: UIImage(named: "JumpingJacks.jpg")!)

        
        let fitclub2 = Fitclub(naam: "Fitclub 2")
        let blok4 = Blok()
        blok4.oefeningen.append(oef10)
        blok4.oefeningen.append(oef11)
        blok4.oefeningen.append(oef12)
        
        let blok5 = Blok()
        blok5.oefeningen.append(oef13)
        blok5.oefeningen.append(oef14)
        blok5.oefeningen.append(oef15)
        
        let blok6 = Blok()
        blok6.oefeningen.append(oef16)
        blok6.oefeningen.append(oef17)
        blok6.oefeningen.append(oef18)
        
        fitclub1.blokken.append(blok4)
        fitclub1.blokken.append(blok5)
        fitclub1.blokken.append(blok6)
        
        fitclubs.append(fitclub2)
     
     }
     
     func addOefening(_oefening: String, _description: String, _image: UIImage) {
        oefeningen.append(Oefening(naam: _oefening, aantal: "5", oefeningDescription: _description, image: _image))
     }
     */
     
    
    
}
