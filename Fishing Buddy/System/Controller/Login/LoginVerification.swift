//
//  LoginVerification.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 13/02/24.
//

import UIKit

class LoginVerification: UIViewController {

    
    @IBOutlet weak var verify: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        verify.layer.cornerRadius = 8
        
        verify.setgradiantcolor(color: [UIColor.garidant2 , UIColor.garidant1], startpoint:  CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func verifyBut(_ sender: Any) {
        
        navigate(Storybord: "Tabbar", identifier: "TabbarVC", VC: self)
       
    }
    

}
