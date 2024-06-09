//
//  ChangePasswordVC.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 13/02/24.
//

import UIKit

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var updatePassBut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updatePassBut.layer.cornerRadius = 8
        updatePassBut.setgradiantcolor(color: [UIColor.garidant2 , UIColor.garidant1], startpoint:  CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
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
