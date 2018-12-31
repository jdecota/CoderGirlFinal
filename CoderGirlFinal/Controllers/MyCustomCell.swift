//
//  MyCustomCell.swift
//  CoderGirlFinal
//
//  Created by Jennifer DeCota on 12/12/18.
//  Copyright © 2018 iOS Class. All rights reserved.
//

import Foundation
import UIKit

// Class to hold outlets for the views that you add to storyboard

class ListItemCell: UITableViewCell {
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myCellLabel: UILabel!
    
    
}



////// AutoLayout
//// TO CLEAR CONSTRAINTS  (constraints will not be replaced, it will create multiple constraints
//        Click triangular (looks like star wars ship) like icon- Click CLEAR CONSTRAINTS
//                If click TOP MENU Clear Constraints, will clear CURRENT SELECTED VIEW constraints
//                If click BOTTOM MENU Clear Constraints, Will clear ALL VIEWS constraints in current controller --- basically a RESET button
//Object Explorer:  View dragged onto UIViewController
//    -> Size Inspector:  height & FixedWidthInteger
//            -> Set constraints:
//Mark: PINNING Method of Constraints
//                        *** ORDER OF STEPS VERY IMPORTANT **
////                        "uncheck" Constrain to margins   ---- SO instead of setting constraints to margin of screen, setting to the edges of the screen
//                        Set Constraints to the VIEW
//                        *** Must Hit SAVE or won't be saved ***
//                           - blue lines will show constrainst
//                            - red lines show up when missing constraints
//                                ** Problems with Pinning:
//                                    Since devices have different aspect ratios, images will stretch and may change their shape
//                                    When switch orientations (landscape/portrait), the pinning will be off
//Mark: ALIGNMENT method of Constraints
//        ** Must have FIXED width & height
//Specifiy Size:
//    of width and height, AND checkmark next to them
//Specifiy Position:
//To Center:  Checkmark "Horizontally in Container"   AND   "Vertically in Container"
//        CLICK "ADD 2 CONSTRAINTS"
//
//Create View Containers to treat portions of view as one
//Object Explorer:
//   To combine multiple items in a view container:
//        -> Place view over area of view you want
//            ->  If includes children (images,etc) highlight them on Project View Hierachy
//                    -> move them to nest them under the View created
//-> After child elements nested:
//          -> Rename View-  single-click once, WAIT 1 sec, single-click again
//                  ->  If want fixed H&W:  fix height & width
//                      center horizontally & vertically

// PINNING Background image to all 4 edges of screen:
//      -> Add 4 Constraints of 0   (? uncheck "constrain to margins" - was unchecked in lesson)
//
//  SET constraint for child objects WITHIN a container
//  ->  set constrains...  use 2 constraints to pin to a corner of the container (UR, UL, etc)
//
//  Create Container view for top section  (one that isn't a fixed size images, etc)
//      ->  check y value of middle container- then make y value of top container same
//      ->  in designing with views, good to give each a color to see them
//  ** ?? EASIEST to create a fixed height and width container, then constrain from there??




//end
