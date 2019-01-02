//
//  SecondViewController.swift
//  CoderGirlFinal
//
//  Created by Jennifer DeCota on 12/30/18.
//  Copyright © 2018 iOS Class. All rights reserved.
//

import UIKit

protocol dataToDelegate {
    func dataFromVcTwo(data : String)
}

class SecondViewController: UIViewController {

    
    @IBOutlet weak var TextFieldTwo: UITextField!
    @IBOutlet weak var LabelTwo: UILabel!
    var data = ""
    var delegate : dataToDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LabelTwo.text = data
        // Do any additional setup after loading the view.
    }
    
    @IBAction func VcTwoButtonPressed(_ sender: UIButton) {
        
        delegate?.dataFromVcTwo(data: TextFieldTwo.text!)
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

        dismiss(animated: true, completion: nil)
        }
    }
        // Mark: NETWORKING
    
    
}
