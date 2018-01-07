//
//  ViewController.swift
//  FitClubApp
//
//  Created by Niels De bruyne on 22/11/2017.
//  Copyright © 2017 Niels De bruyne. All rights reserved.
//

import UIKit

class ViewControllerScreen1: UITableViewController {

    @IBOutlet weak var myTable: UITableView!
    
    var oef1: String = ""
    var oef2: String = ""
    
    var aantal1: String = ""
    var aantal2: String = ""
    
    var image1: UIImage = #imageLiteral(resourceName: "BenenGooien.jpg")
    var image2: UIImage = #imageLiteral(resourceName: "BenenGooien.jpg")
    
    var fitclubs = [Fitclub]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fitclubs = DataRepo().fitclubs
        
        
        self.title = "Blok 1"
        myTable.delegate = self
        myTable.dataSource = self
        
        let nibName = UINib(nibName: "TableCellTableViewCell", bundle: nil)
        myTable.register(nibName, forCellReuseIdentifier: "myCell")
        
        oef1 = fitclubs[myIndex].oefeningen[0].naam
        oef2 = fitclubs[myIndex].oefeningen[1].naam
        
        aantal1 = fitclubs[myIndex].oefeningen[0].aantal!

        aantal2 = fitclubs[myIndex].oefeningen[1].aantal!

        if(myIndex == 0) {
            image1 = UIImage(named:"Pompen.jpg")!
            image2 = UIImage(named:"Squad")!
        } else {
            image1 = UIImage(named:"SitUp.jpg")!
            image2 = UIImage(named:"Pompen.jpg")!
        }
        

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fitclubs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableCellTableViewCell
        cell.commonInit(_imageName: image1, _titel: "Oefening", _oefening: "Oefening 1", _aantal: "Aantal" + " 4")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

