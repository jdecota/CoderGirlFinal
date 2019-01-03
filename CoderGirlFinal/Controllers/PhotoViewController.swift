//
//  PhotoViewController.swift
//  CoderGirlFinal
//
//  Created by Jennifer DeCota on 1/2/19.
//  Copyright © 2019 iOS Class. All rights reserved.
//

import UIKit
import Foundation

class PhotoViewController: UIViewController {
        

    @IBOutlet weak var photoImageView: UIImageView!
    

    var photo: UIImage?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            photoImageView.image = photo
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


