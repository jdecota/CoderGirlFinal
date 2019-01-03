//  ListViewController.swift  //  CoderGirlFinalCreated by Jennifer DeCota on 12/12/18. //  Copyright © 2018 iOS Class. All rights reserved.

import UIKit
import Foundation

struct FlickerJSON: Codable {
    struct FlickrItem: Codable {
        let media: Dictionary<String, String>
        let title: String
    }
    let items: [FlickrItem]
}

struct FlckrPhoto {
    let image: UIImage
    let title: String
}

class FlickrTableViewController: UITableViewController {
    
    var photos: [FlckrPhoto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFlickrImage()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func loadFlickrImage() {
        
        // Create a configuration
        
        let configuration = URLSessionConfiguration.ephemeral
        
        // Create a session
        
        let session = URLSession(configuration: configuration)
        
        // Setup the url
        let url = URL(string: "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1")!
        
        // Create the task
        
        let task = session.dataTask(with: url) {
            
            (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let media = try decoder.decode(FlickerJSON.self, from: data)
                for item in media.items {
                    if let imageURL = item.media["m"] {
                        let url = URL(string: imageURL)!
                        let imageData = try Data(contentsOf: url)
                        if let image = UIImage(data: imageData) {
                            let flickrImage = FlckrPhoto(image: image, title: item.title)
                            self.photos.append(flickrImage)
                        }
                    }
                }
                let queue = OperationQueue.main
                queue.addOperation {
                    self.tableView.reloadData()
                }
            } catch {
                print("Error info: \(error)")
            }
        }
        task.resume()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlickrCell", for: indexPath)
        
        cell.imageView?.image = photos[indexPath.row].image
        cell.textLabel?.text = photos[indexPath.row].title
        
        return cell
    }
    
    
    //Mark:  didSelectRowAt method to run when table view cell is tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row) //prints the row number
        //print(photos[indexPath.row]) //prints the item in that index of the array
        performSegue(withIdentifier: "PhotoSegue", sender: photos[indexPath.row])
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoSegue" {
                print("preparForSegue called")
            guard let cell = sender as? UITableViewCell,
                let photoViewController = segue.destination as? PhotoViewController,
                let indexPath = tableView.indexPath(for: cell)
         else {
                return
            }
            let flickrPhoto = photos[indexPath.row]
            photoViewController.photo = flickrPhoto.image
            
        }
    }
    
}










//
/*
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
 */
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

