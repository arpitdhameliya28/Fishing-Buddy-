//
//  PremiumPopup.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 14/02/24.
//

import UIKit

class PremiumPopup: UIViewController {

    @IBOutlet weak var viewPopup: UIView!
    
    @IBOutlet weak var unlockFeatures: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        viewPopup.layer.cornerRadius = 15
        unlockFeatures.layer.cornerRadius = 8
        unlockFeatures.setgradiantcolor(color: [UIColor.garidant2 , UIColor.garidant1], startpoint:  CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
        unlockFeatures.clipsToBounds  = true
        
    }
    
    @IBAction func unlock(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
