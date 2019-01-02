// FirstViewController.swift
//  CoderGirlFinal

import UIKit
import Foundation
import Alamofire
import SwiftyJSON
import SVProgressHUD

class FirstViewController: UIViewController, dataToDelegate {
    

    @IBOutlet weak var VcOneLabel: UILabel!
    @IBOutlet weak var TextFieldOne: UITextField!
    @IBOutlet weak var ScrollOne: UIScrollView!
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    //  let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var finalURL : String = ""
    var finalURL1a : String = ""
    var dataVcOne : String = ""
    var dataFromVcTwo : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK: - Networking
    
    // func getWeatherData(url: String, parameters: [String : String]) {
    // -> Edit name and remove parameter;  don't have parameters for bitcoin app
    func getBitcoinData(url: String) {
        //Alamofire.request(url, method: .get, parameters: parameters)
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {
                    
                    print("Successful Connection!")
                    //format the data we get back
                    //create constasnt of type JSON with the value of the result of the response
                    // ( ) to CAST value to JSON Format
                    //prob 1 comes back in form of optional so need to force unwrapping
                    //prob 2 is value is
                    
                    let bitcoinJSON : JSON = JSON(response.result.value!)
                    print (bitcoinJSON)
                    self.updateBitcoinData(json: bitcoinJSON)
                    
                } else {
                    print("Error: \(String(describing: response.result.error))")
                    self.VcOneLabel.text = "Connection Issues"
                }
        }
    }
    //MARK: JSON Parsing     passing in the JSON that we got from the api
    func updateBitcoinData(json : JSON) {
        
        // IF LET so we can use Optional Binding
        // if let bitcoinResult = json["averages"]["day"].double {   // if nested request...
        if let bitcoinResult = json["ask"].double {
            // bitcoinResult is a Double so either can use String Interpolation:   = "\(bitcoinResult)"
            // Or can CAST it into a String:
            //TextFieldOne.text = String(bitcoinResult)
            dataVcOne = String(bitcoinResult)
            VcOneLabel.text = String(bitcoinResult)
            //* This won't update the label;  need to call this function where we get finalURL
            // if using currencySymbolArray:   = currencySelected + String(bitcoinResult)
            
        } else {
            
            TextFieldOne.text = "Information Unavailable"
        }
    }
    
    //MARK: Segue from button pressed
    @IBAction func sendVcOnePressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "sendToSecondVC", sender: self)
    }
    // Passes the selected object to the new view controller.
    // Tap into the receiving view controller using segue.destination
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendToSecondVC" {
                        print("prepareForSegue Called")
            let secondSecondVC = segue.destination as! SecondViewController
                        print("secondVC created")
            finalURL = (baseURL + TextFieldOne.text!)
                        print(finalURL)
            getBitcoinData(url: finalURL)
                        print("getBitcoinData called")
            // to receive data, must set self as delegate (in prepareForSegue??)
            secondSecondVC.delegate = self
                //secondSecondVC.data = TextFieldOne.text!
            secondSecondVC.data = String(dataVcOne)
                        print("secondsecondVC data equals dataVcOne")
        }
    }
    
    //MARK:  Requirement For Conforming to Delegate
    func dataFromVcTwo(data: String) {
        
        finalURL1a = String(data)
        //label.text = data
        //VcOneLabel.text = data
        //dataVcOne = data
        getBitcoinData(url: finalURL1a)
        
    }
}




