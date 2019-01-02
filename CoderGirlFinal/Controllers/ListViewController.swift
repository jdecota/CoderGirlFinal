//  ListViewController.swift  //  CoderGirlFinalCreated by Jennifer DeCota on 12/12/18. //  Copyright © 2018 iOS Class. All rights reserved.
//
import UIKit
import Foundation

protocol dataToList {
    func listDataFromVcTwo()
}

// //Mark:  TableVeiwController to Inheriting UITable
// //By inheriting a UITableViewController & adding a TableViewController to Storyboard automatically LINKs up the @IBOutlets; sets the delegate and datasource//class
//
class ListViewController: UITableViewController {

    //Mark: Create list array variable of strings that will be data for table view cells
    
    //var item : String
    var itemArray = ["item1", "item2", "item3"]
    //var delegate : dataToList


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
        return cell
    }
//                        // cell created with dequeueReusableCell,
//                        // cell populated with text from current row
//                        //  cell is expected output of UITableViewCell
//    }
//
//    //Mark: Add TableView Delegate Methods
//    //Mark:  didSelectRowAt method to run when table view cell is tapped
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row) //prints the row number
//        print(itemArray[indexPath.row]) //prints the item in that index of the array
//    }
//

//    //Mark: Add New Item
//    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
//
//        var textField = UITextField()
//        // Add Alert Pop Up when button pressed
//        let alert = UIAlertController(title: "Add New List Item", message: "", preferredStyle: .alert)
//
//        // Create UIAlert Action
//        let action = UIAlertAction(title: "Add", style: .default)  // creat closure for handler:  //<#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>)
//        {(action) in
//            // what happens when user clicks Add Item button on our UIAlert
//            print ("Add Item Pressed")
//            // add to item array
//            self.itemArray.append(textField.text!)
//                   //force unwrap so will give blank if "blank"
//                    // OR can create a default value
//            print(textField.text!)
//            self.tableView.reloadData()
//        }
//
//        // add text field to alert
//        //alert.addTextField(configurationHandler: <#T##((UITextField) -> Void)?##((UITextField) -> Void)?##(UITextField) -> Void#>)
//        // name the textField - alertTextField
//        alert.addTextField { (alertTextField) in
//            //placeholder is the "greyed out" text shown
//            alertTextField.placeholder = "Create New Item"
//            print("alertTextField.text EMPTY because empty until when button pressed")
//            textField = alertTextField
//
//        }
//
//        alert.addAction(action)
//
//        //Now SHOW Alert
//        present(viewControllerToPresent: UIViewController), animated: Bool, completion:  -> Void)? {
////        viewController.. (alert) animated: true   completion: nil
////        present(alert, animated: true, completion: nil)
//
//
//
//
//
////    //Mark: Data Model Manipulation Methods

        
        
////        //Mark: Add Accessory to cell
//  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = super.tableView(tableView, cellForRowAt: indexPath)
//   // tableView.cellForRow(at: indexPath)?.accessoryType:  //for IndexPath- var indexPath: ref to cell at the indexPath
////
//        //Mark: Add  AND   Remove Accessory to cell such as checkmark
//        // if, else:  IF (so ==) cell has checkmark, then should be changed to = none
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//        tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {
//            // ELSE (cell is none): cell checkmark should be changed = checkmark
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
//
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
        ////    if let item = todoItems?[indexPath.row] {
        ////
        ////        cell.textLabel?.text = item.title
        ////
        ////        if let colour = UIColor(hexString: selectedCategory!.colour)?.darken(byPercentage: CGFloat(indexPath.row) / CGFloat(todoItems!.count)) {
        ////            cell.backgroundColor = colour
        ////            cell.textLabel?.textColor = ContrastColorOf(colour, returnFlat: true)
        ////        }
        //
        //        //            print("version 1: \(CGFloat(indexPath.row / todoItems!.count))")
        //        //
        //        //            print("version 2: \(CGFloat(indexPath.row) / CGFloat(todoItems!.count))")
        //
        //
        //
        //        //Ternary operator ==>
        //        // value = condition ? valueIfTrue : valueIfFalse
        //
        //        cell.accessoryType = item.done ? .checkmark : .none
        //    } else {
        //        cell.textLabel?.text = "No Items Added"
        //    }
        //
        //    return cell
        //}
}
