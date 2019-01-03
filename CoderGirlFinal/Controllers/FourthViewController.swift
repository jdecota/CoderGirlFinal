//
//  FourthViewController.swift
//  CoderGirlFinal
//
//  Created by Jennifer DeCota on 1/2/19.
//  Copyright © 2019 iOS Class. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
        var photo: UIImage?
        var dataVCOneToFour : String = ""
    
    override func viewDidLoad() {
            super.viewDidLoad()
            photoImageView.image = photo
        }
    }

//class FourthViewController: UIViewController {

//
//    var dataVCOneToFour : String = ""
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        quoteLabel.text = dataVCOneToFour
//        // Do any additional setup after loading the view.
//    }
//

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

