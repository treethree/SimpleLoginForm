//
//  ThirdViewController.swift
//  SimpleLoginForm
//
//  Created by SHILEI CUI on 3/13/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tabView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //only need for plain tableView
        tabView.tableFooterView = UIView()

//        tabView.dataSource = self
//        tabView.delegate = self
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //must put togeter
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    //must put togeter
    //indexPath is important
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //dequeueReusableCell: Returns a reusable table-view cell object for the specified reuse identifier and adds it to the table.
        // only the size of screen table cell will be allocated  in memory, if we have 1000 numberOfRowsInSection we only create one screen of table number of cell.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
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
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0{
//            return "Firts header"
//        }else{
//            return "Second header"
//        }
//    }
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        if section == 0{
//            return "Firts footer"
//        }else{
//            return "Second footer"
//        }
//    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
