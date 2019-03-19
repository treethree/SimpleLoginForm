//
//  ThirdViewController.swift
//  SimpleLoginForm
//
//  Created by SHILEI CUI on 3/13/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate ,UISearchBarDelegate{

    @IBOutlet weak var tabView: UITableView!
    
    @IBOutlet weak var uiSearchBar: UISearchBar!
    var dataSource = ObjectDataSource()
    

//  var bookArray : Array<Book> = [Book.init(name: "Harry", detail: "Magic"),Book.init(name: "Harry", detail: "Magic"),Book.init(name: "Harry", detail: "Magic"),Book.init(name: "Harry", detail: "Magic"),Book.init(name: "Harry", detail: "Magic")]
    
//    var person : [Book] = [Book(name: "n1", detail: "sdadsada"), Book(name: "n2", detail: "afdfdsgds"), Book(name: "n3", detail: "fsdfdsfreg")]
    
    var arrOriginal : Array<Book
        > = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //only need for plain tableView
        //tabView.tableFooterView = UIView()
        
        tabView.dataSource = dataSource
        
//        tabView.dataSource = self
//        tabView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        dataSource.bookArray = arrOriginal
        tabView.reloadData()
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty{
            dataSource.bookArray = arrOriginal
            tabView.reloadData()
        }
        
        searchBar.text = searchText.uppercased()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if !(searchBar.text?.isEmpty)!{
            
            dataSource.bookArray = arrOriginal.filter({($0.name?.uppercased().contains(searchBar.text!))!})
            tabView.reloadData()
        }
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        if selectedScope == 0 {
            //dataSource.bookArray.sort(by: {$0.age! < $1.age!})
            dataSource.bookArray.sort(by: {$0.detail! < $1.detail!})
        }else{
            dataSource.bookArray.sort(by: {$0.name! < $1.name!})
        }
        tabView.reloadData()
    }
    
    
    @IBAction func btnClick(_ sender: Any) {
        let str = "Hello"
        dataSource.arrayName.append(str)
        tabView.reloadData()
    }
    @IBAction func editBtnClick(_ sender: UIBarButtonItem) {
        tabView.isEditing = !tabView.isEditing
    }
    //navigation controller should get called in ViewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let str = dataSource.arrayName[indexPath.row]
        //      print(str)
        if let controller = storyboard?.instantiateViewController(withIdentifier: "ForthViewController") as? ForthViewController{
            controller.valueForLabel = str
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    // define different action for row.
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .normal, title: "Share") { (action, indexPath) in
            print(indexPath.row)
        }
        
        let deleteAction = UITableViewRowAction(style: .normal, title: "Delete") { (action, indexPath) in
            print(indexPath.row)
        }
        return [shareAction, deleteAction]
    }
}
