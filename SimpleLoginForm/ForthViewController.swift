//
//  ForthViewController.swift
//  SimpleLoginForm
//
//  Created by SHILEI CUI on 3/13/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

class ForthViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusecell")
        let indexStartFromOne = indexPath.row + 1
        if indexStartFromOne % 3 == 0 && indexStartFromOne % 5 == 0{
            cell?.textLabel?.text = "OLACAB "
        }
        else if indexStartFromOne % 5 == 0{
            cell?.textLabel?.text = "CAB"
        }
        else if indexStartFromOne % 3 == 0{
            cell?.textLabel?.text = "OLA"
        }
        else{
            cell?.textLabel?.text = "\(indexStartFromOne) "
        }
        return cell!
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
