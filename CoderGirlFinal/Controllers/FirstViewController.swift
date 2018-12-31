//
//  FirstViewController.swift
//  CoderGirlFinal
//
//  Created by Jennifer DeCota on 12/30/18.
//  Copyright © 2018 iOS Class. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var VcOneLabel: UILabel!
    @IBOutlet weak var TextFieldOne: UITextField!
    @IBOutlet weak var ScrollOne: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendVcOnePressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "sendToSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendToSecondVC" {
            let secondSecondVC = segue.destination as! SecondViewController
            
            secondSecondVC.data = TextFieldOne.text!
            //secondReceivingVC.delegate = self
        }
    }
    func dataReceived(data: String) {
        VcOneLabel.text = data
    }
}


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


