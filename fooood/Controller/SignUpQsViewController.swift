//
//  SignUpQsViewController.swift
//  fooood
//
//  Created by Susan Chappuis Hanson on 14/04/2020.
//  Copyright © 2020 Susan Chappuis Hanson. All rights reserved.
//

import UIKit

class SignUpQsViewController: UIViewController {
    
    @IBOutlet weak var selectionOne: UIButton!
    @IBOutlet weak var selectionTwo: UIButton!
    @IBOutlet weak var selectionThree: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    var screenCounter = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func nextPressed(_ sender: UIButton) {
        
//        print(screenCounter)
//
//            screenCounter += 1
//
//            while screenCounter > 3 {
//
//                if screenCounter == 1 {
//
//                    selectionOne.isHidden = true
//                    selectionTwo.isHidden = true
//                    selectionThree.isHidden = true
//
//                    textField.isHidden = false
//
//                } else if screenCounter == 2 {
//
//                    textField.placeholder = "Your Password"
//
//                }
//
//            }
//
//        if screenCounter == 3 {
//
//                performSegue(withIdentifier: "toHomeScreenSegue", sender: self)
//
//            }
        
        performSegue(withIdentifier: "toHomeScreenSegue", sender: self)
        }
        
        
}
