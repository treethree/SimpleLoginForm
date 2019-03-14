//
//  ForthViewController.swift
//  SimpleLoginForm
//
//  Created by SHILEI CUI on 3/13/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

class ForthViewController: UIViewController{

    @IBOutlet weak var uiLabelVal: UILabel!
    var valueForLabel : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiLabelVal.text = valueForLabel
        // Do any additional setup after loading the view.
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
