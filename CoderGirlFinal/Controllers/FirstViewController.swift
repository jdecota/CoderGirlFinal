// FirstViewController.swift
//  CoderGirlFinal

import UIKit

class FirstViewController: UIViewController, dataToDelegate {
    
    @IBOutlet weak var VcOneLabel: UILabel!
    @IBOutlet weak var TextFieldOne: UITextField!
    @IBOutlet weak var ScrollOne: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //MARK: Segue from button pressed
    @IBAction func sendVcOnePressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "sendToSecondVC", sender: self)
    }
        // Pass the selected object to the new view controller.
            // Get the new view controller using segue.destination.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendToSecondVC" {
            let secondSecondVC = segue.destination as! SecondViewController
            
            secondSecondVC.data = TextFieldOne.text!
            secondSecondVC.delegate = self
        }
    }

    //MARK:  Requirement For Conforming to Delegate
    func dataFromVcTwo(data: String) {
        VcOneLabel.text = data
    }
}




