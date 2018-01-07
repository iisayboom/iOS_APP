//
//  TableViewController3rdBlok.swift
//  FitClubApp
//
//  Created by Niels De bruyne on 01/12/2017.
//  Copyright © 2017 Niels De bruyne. All rights reserved.
//

import UIKit

class TableViewController3rdBlok: UITableViewController {
    
    @IBOutlet var myTableView: UITableView!
    var fitclub:Fitclub?
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Part 3"
        myTableView.delegate = self
        myTableView.dataSource = self
        
        let nibName = UINib(nibName: "TableCellTableViewCell", bundle: nil)
        myTableView.register(nibName, forCellReuseIdentifier: "myCell")
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.fitclub?.blokken[2].oefeningen.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableCellTableViewCell
        
        let url = URL(string: (self.fitclub?.blokken[2].oefeningen[indexPath.row].image)!)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
                cell.commonInit(_imageName: self.image, _oefening: (self.fitclub?.blokken[2].oefeningen[indexPath.row].naam)!, _aantal: "Amount: " + (self.fitclub?.blokken[2].oefeningen[indexPath.row].aantal!)!)
            }
        }
        
        return cell
    }
    /*
    //is deze manier slechter als een unwind segway als je geen data moet doorspelen/ophalen/veranderen?
     
    @IBAction func showOverview(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    */
    
    @IBAction func showAllFitclubs(_ sender: Any) {
        performSegue(withIdentifier: "showAllFitclubs", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
