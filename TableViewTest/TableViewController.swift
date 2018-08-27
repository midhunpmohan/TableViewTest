//
//  TableViewController.swift
//  TableViewTest
//
//  Created by Konstantin Mishukov on 27/08/2018.
//  Copyright © 2018 KMDev. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var numbersArray: NSMutableArray = [1,2,3,4,5,6,7,8,9,10]
    
    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbersArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(numbersArray[indexPath.row])"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if tableView.isEditing {
            return .delete
        }
        return .none
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            numbersArray.remove(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.perform(#selector(reloadTable), with: nil, afterDelay: 1)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    @objc func reloadTable(){
        DispatchQueue.main.async { //please do all interface updates in main thread only
        self.tableView.reloadData()
        }
    }
    
}
