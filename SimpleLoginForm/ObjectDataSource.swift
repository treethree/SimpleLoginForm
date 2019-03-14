//
//  ObjectDataSource.swift
//  SimpleLoginForm
//
//  Created by SHILEI CUI on 3/13/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

class ObjectDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    var arrayName = ["Jam", "Kelven", "Monal", "Hafer", "John"]

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //must put togeter
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayName.count
    }
    //must put togeter
    //indexPath is important
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //dequeueReusableCell: Returns a reusable table-view cell object for the specified reuse identifier and adds it to the table.
        // only the size of screen table cell will be allocated  in memory, if we have 1000 numberOfRowsInSection we only create one screen of table number of cell.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let str = arrayName[indexPath.row]
        //let indexStartFromOne = indexPath.row + 1
        cell?.textLabel?.text = str

        //        if indexStartFromOne % 3 == 0 && indexStartFromOne % 5 == 0{
        //            cell?.textLabel?.text = "OLACAB "
        //        }
        //        else if indexStartFromOne % 5 == 0{
        //            cell?.textLabel?.text = "CAB"
        //        }
        //        else if indexStartFromOne % 3 == 0{
        //            cell?.textLabel?.text = "OLA"
        //        }
        //        else{
        //            cell?.textLabel?.text = "\(indexStartFromOne) "
        //        }
        return cell!
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    //allow tableview's cell to move around
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = arrayName.remove(at: sourceIndexPath.row)
        arrayName.insert(temp, at: destinationIndexPath.row)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            if indexPath.row != 0{
                arrayName.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    //merge tableViewDelegate into tableViewDataSource make it relevant, better not put delegate into seperate file.
}
