//
//  ObjectDelegate.swift
//  SimpleLoginForm
//
//  Created by SHILEI CUI on 3/13/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

class ObjectDelegate: NSObject,UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let str = arrayName[indexPath.row]
        print(str)
        if let controller = storyboard?.instantiateViewController(withIdentifier: "ForthViewController") as? ForthViewController{
            controller.valueForLabel = str
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
