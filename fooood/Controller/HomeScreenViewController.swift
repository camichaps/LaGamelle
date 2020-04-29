//
//  HomeScreenViewController.swift
//  fooood
//
//  Created by Susan Chappuis Hanson on 14/04/2020.
//  Copyright © 2020 Susan Chappuis Hanson. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func chooseADateButtonPressed(_ sender: UIButton) {
        
        let popupVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DatePickerPopupID") as! DatePickerPopupViewController
        
        self.addChild(popupVC)
        popupVC.view.frame = self.view.frame
        self.view.addSubview(popupVC.view)
        popupVC.didMove(toParent: self)
        
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
