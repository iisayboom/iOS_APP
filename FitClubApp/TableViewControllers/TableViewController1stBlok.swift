//
//  TableViewController1stBlok.swift
//  FitClubApp
//
//  Created by Niels De bruyne on 01/12/2017.
//  Copyright © 2017 Niels De bruyne. All rights reserved.
//

import UIKit

class TableViewController1stBlok: UITableViewController {

    @IBOutlet var myTableView: UITableView!
    var fitclub:Fitclub?
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Part 1"
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        let nibName = UINib(nibName: "TableCellTableViewCell", bundle: nil)
        myTableView.register(nibName, forCellReuseIdentifier: "myCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.fitclub?.blokken[0].oefeningen.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableCellTableViewCell
    
        let url = URL(string: (self.fitclub?.blokken[0].oefeningen[indexPath.row].image)!)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
                cell.commonInit(_imageName: self.image, _oefening: (self.fitclub?.blokken[0].oefeningen[indexPath.row].naam)!, _aantal: "Amount: " + (self.fitclub?.blokken[0].oefeningen[indexPath.row].aantal!)!)
            }
        }
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPart2" {
            let secondController = segue.destination as! TableViewController2ndBlok
            secondController.fitclub = self.fitclub
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}
