//
//  SecondViewController.swift
//  SimpleLoginForm
//
//  Created by SHILEI CUI on 3/11/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var labelStartVal : String?
    var passingPwValue : String?
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var pwValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelValue.text = labelStartVal
        pwValue.text = passingPwValue
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
