//
//  SecondViewController.swift
//  CoderGirlFinal
//
//  Created by Jennifer DeCota on 12/30/18.
//  Copyright © 2018 iOS Class. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var TextFieldTwo: UITextField!
    @IBOutlet weak var LabelTwo: UILabel!
    var data = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LabelTwo.text = data
        // Do any additional setup after loading the view.
    }
    
    @IBAction func VcTwoButtonPressed(_ sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
