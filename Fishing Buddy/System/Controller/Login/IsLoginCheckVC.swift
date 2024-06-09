//
//  IsLoginCheckVC.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 12/02/24.
//

import UIKit

class IsLoginCheckVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaults.standard.bool(forKey: "UserIsLogin") == true {
            navigate(Storybord: "Main", identifier: "LoginVerification", VC: self)
        }
        else {
            navigate(Storybord: "Main", identifier: "LoginVC", VC: self)
        }
    }
    

  

}
