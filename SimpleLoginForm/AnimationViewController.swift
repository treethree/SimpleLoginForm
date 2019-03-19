//
//  AnimationViewController.swift
//  SimpleLoginForm
//
//  Created by SHILEI CUI on 3/15/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    @IBOutlet weak var bottomCons: NSLayoutConstraint!
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var viewOutlet: UIView!
    
    

    @IBOutlet weak var viewTopCons: NSLayoutConstraint!
    
    @IBOutlet weak var viewHeightCons: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnAction(_ sender: UIButton) {
//        change the position of subView using constrain
//        sender.isSelected = !sender.isSelected
//        topCons.constant = sender.isSelected ? 500 : 50
//
//        topCons.constant = topCons.constant == 50 ?  500 : 50
//
//        UIView.animate(withDuration: 1.5){
//            self.viewTopCons.constant = self.viewTopCons.constant == 50 ? 500 : 50
//            self.view.layoutIfNeeded()
//        }
    
        UIView.animate(withDuration: 1.5){
            self.viewHeightCons.constant = self.viewHeightCons .constant == 60 ? 500 : 60
            self.view.layoutIfNeeded()
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
