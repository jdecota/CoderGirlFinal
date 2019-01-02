//  SecondViewController.swift    CoderGirlFinal
//  Created by Jennifer DeCota on 12/30/18.
//  Copyright © 2018 iOS Class. All rights reserved.

import UIKit
import Foundation
import Alamofire
import SwiftyJSON


protocol dataToDelegate {
    func dataFromVcTwo(data : String)
}

class SecondViewController: UIViewController {

    
    @IBOutlet weak var TextFieldTwo: UITextField!
    @IBOutlet weak var LabelTwo: UILabel!
    var data = ""
    var delegate : dataToDelegate?
    //LabelTwo.titleCNY = "placeholder text"
    var dataToVcOne : String = ""
    
    let baseURL2 = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    //  let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var finalURL2 : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LabelTwo.text = data
        //LabelTwo.text = "data goes here"
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Networking
    
//    func getBitcoinData(url: String) {
//        //Alamofire.request(url, method: .get, parameters: parameters)
//        Alamofire.request(url, method: .get)
//            .responseJSON { response in
//                if response.result.isSuccess {
//
//                    print("Successful Connection!")
//                    //format the data we get back
//                    //create constasnt of type JSON with the value of the result of the response
//                    // ( ) to CAST value to JSON Format
//                    //prob 1 comes back in form of optional so need to force unwrapping
//                    //prob 2 is value is
//
//                    let bitcoinJSON : JSON = JSON(response.result.value!)
//                    print (bitcoinJSON)
//                    self.updateBitcoinData(json: bitcoinJSON)
//
//                } else {
//                    print("Error: \(String(describing: response.result.error))")
//                    //self.LabelTwo.text = "Connection Issues"
//                }
//        }
//    }
//    //MARK: JSON Parsing     passing in the JSON that we got from the api
//    func updateBitcoinData(json : JSON) {
//
//        // IF LET so we can use Optional Binding
//        // if let bitcoinResult = json["averages"]["day"].double {   // if nested request...
//        if let bitcoinResult = json["ask"].double {
//            // bitcoinResult is a Double so either can use String Interpolation:   = "\(bitcoinResult)"
//            // Or can CAST it into a String:
//            //TextFieldOne.text = String(bitcoinResult)
//             dataToVcOne = String(bitcoinResult)
//            //* This won't update the label;  need to call this function where we get finalURL
//            // if using currencySymbolArray:   = currencySelected + String(bitcoinResult)
//
//        } else {
//
//            //TextFieldOne.text = "Information Unavailable"
//        }
//    }

    
    @IBAction func VcTwoButtonPressed(_ sender: UIButton) {
        
        print("VcTwoButtonPressed")
        // Call protcol function property OF delegate PASSING in the data
        //delegate?.dataFromVcTwo(data: TextFieldTwo.text!)
    
//        let finalURL = (baseURL2 + TextFieldTwo.text!)
//        print(finalURL)
//        getBitcoinData(url: finalURL)
        //print("getBitcoinData Called")

        //delegate?.dataFromVcTwo(data: dataToVcOne)
        //dismiss(animated: true, completion: nil)
        
        finalURL2 = (baseURL2 + TextFieldTwo.text!)
        delegate?.dataFromVcTwo(data: finalURL2)
        dismiss(animated: true, completion: nil)
        
    }
    

    
    @IBAction func getListButtonPressed(_ sender: UIButton) {
        /* delegate?.dataFromVcTwo(data: TextFieldTwo.text!)
        */
        performSegue(withIdentifier: "goToListVc", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToListVc" {
        
        let secondListVc = segue.destination as! ListViewController
        
        print("segue.destination equals so data can be entered here" )
        //secondListVc.itemArray =
        }
    }


}
