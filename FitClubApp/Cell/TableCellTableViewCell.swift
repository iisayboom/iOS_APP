//
//  TableCellTableViewCell.swift
//  FitClubApp
//
//  Created by Niels De bruyne on 01/12/2017.
//  Copyright © 2017 Niels De bruyne. All rights reserved.
//

import UIKit

class TableCellTableViewCell: UITableViewCell {

    @IBOutlet weak var imgOefening: UIImageView!
    @IBOutlet weak var txtAantal: UILabel!
    @IBOutlet weak var txtOefening: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(_imageName: UIImage, _oefening: String, _aantal: String) {
        imgOefening.image = _imageName
        txtOefening.text = _oefening
        txtAantal.text = _aantal
    }

}
