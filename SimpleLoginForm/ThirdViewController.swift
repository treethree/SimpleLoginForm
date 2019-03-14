//
//  ThirdViewController.swift
//  SimpleLoginForm
//
//  Created by SHILEI CUI on 3/13/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var tabView: UITableView!
    
    var dataSource = ObjectDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //only need for plain tableView
        //tabView.tableFooterView = UIView()
        
        tabView.dataSource = dataSource
//        tabView.dataSource = self
//        tabView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnClick(_ sender: Any) {
        let str = "Hello"
        dataSource.arrayName.append(str)
        tabView.reloadData()
    }
    @IBAction func editBtnClick(_ sender: UIBarButtonItem) {
        tabView.isEditing = !tabView.isEditing
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let str = dataSource.arrayName[indexPath.row]
        //      print(str)
        if let controller = storyboard?.instantiateViewController(withIdentifier: "ForthViewController") as? ForthViewController{
            controller.valueForLabel = str
            navigationController?.pushViewController(controller, animated: true)
        }
    }

}
