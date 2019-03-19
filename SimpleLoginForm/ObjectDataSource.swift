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

    var nameInfo = ["Jam is a student", "Kelven is doctor", "Monal is a police", "Hafer is a chef", "Join is a superstar"]
    var contactInfo = ["1232131242","234324223","35436366","56456564","7686878"]
    
    var imageSet = ["bw","ca","hulk","ironman","thor"]
    
    var bookArray : Array<Book> = [Book.init(name: "Harry1", detail: "Magic1"),Book.init(name: "Harry2", detail: "Magic2"),Book.init(name: "Harry3", detail: "Magic3"),Book.init(name: "Harry4", detail: "Magic4"),Book.init(name: "Harry5", detail: "Magic5")]
    
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
        //prototype cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell") as! PersonTableViewCell
        let str = arrayName[indexPath.row]
        //cell.lblFirstName.text = str
        cell.lblNickName.text = nameInfo[indexPath.row]
        //cell.lblNickName.text = bookArray[indexPath.section].name
        cell.lblContact.text = "Contact: " + contactInfo[indexPath.row]
        cell.lblTiming.text = "Timing: "
        cell.lblDistance.text = "Distance: "
        cell.imgOutlet.image = UIImage(named: imageSet[indexPath.row])
        cell.btn1.addTarget(self, action: #selector(btnNextAction), for: .touchUpInside)
        cell.btn1.tag = indexPath.row
        return cell
    }
    
    @objc func btnNextAction(sender: UIButton){
        let str = arrayName[sender.tag]
        print(str)
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row == 0{
            return false
        }
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
                arrayName.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    //merge tableViewDelegate into tableViewDataSource make it relevant, better not put delegate into seperate file.
    
    
}
