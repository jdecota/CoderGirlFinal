//
//  ListViewController.swift
//  CoderGirlFinal
//
//  Created by Jennifer DeCota on 12/12/18.
//  Copyright © 2018 iOS Class. All rights reserved.
//

import Foundation
import UIKit

// Mark:  TableVeiwController to Inheriting UITable
// By inheriting a UITableViewController & adding a TableViewController to Storyboard automatically LINKs up the @IBOutlets; sets the delegate and datasource

class ListViewController: UITableViewController {
    
    //Mark: Create list array variable of strings that will be data for table view cells
    
    let itemArray = ["item1", "item2", "item3"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //Mark: Create Table View Methods for   UI Table VIEW  (rows and cell display)
    
    //Mark:  datasource method- numberOfRowsInSection to define number of rows in the view
    override func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //Mark:  Create a cell for each row in table view

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemReuseCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]  //current row of current index path
        return cell  // cell created with dequeueReusableCell,
                        // cell populated with text from current row
                        //  cell is expected output of UITableViewCell
    }
 
//Mark: Add TableView Delegate Methods
    //Mark:  didSelectRowAt method to run when table view cell is tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row) //prints the row number
        print(itemArray[indexPath.row]) //prints the item in that index of the array
        
        //Mark: Add Accessory to cell
        //tableView.cellForRow(at: indexPath)?.accessoryType:  for IndexPath- var indexPath: ref to cell at the indexPath
        
        //Mark: Add  AND   Remove Accessory to cell such as checkmark
        // if, else:  IF (so ==) cell has checkmark, then should be changed to = none
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            // ELSE (cell is none): cell checkmark should be changed = checkmark
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    

    
    
    
    
    
    //Mark: Data Model Manipulation Methods
    
    
}
