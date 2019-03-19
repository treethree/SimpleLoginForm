//
//  PersonTableViewCell.swift
//  SimpleLoginForm
//
//  Created by SHILEI CUI on 3/14/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblNickName: UILabel!
    @IBOutlet weak var lblContact: UILabel!
    
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var lblTiming: UILabel!
    
    @IBOutlet weak var imgOutlet: UIImageView!
    
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var btn2: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgOutlet.layer.borderWidth = 1
        imgOutlet.layer.masksToBounds = false
        imgOutlet.layer.borderColor = UIColor.black.cgColor
        imgOutlet.layer.cornerRadius = imgOutlet.frame.height/2
        imgOutlet.clipsToBounds = true
        
        btn1.layer.cornerRadius = 0.5 * btn1.bounds.size.width
        btn1.clipsToBounds = true
        
        btn2.layer.cornerRadius = 0.5 * btn2.bounds.size.width
        btn2.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func btnLeft(_ sender: Any) {
    }
    @IBAction func btnRight(_ sender: Any) {
    }
}
