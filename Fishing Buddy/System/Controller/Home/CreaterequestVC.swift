//
//  CreaterequestVCViewController.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 19/02/24.
//

import UIKit

class CreaterequestVC: UIViewController , datepass{
   
    @IBOutlet weak var selectLocstio: UIButton!
    
    @IBOutlet weak var datepicTextfiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.string(forKey: "DOB")
        selectLocstio.layer.cornerRadius = 8
        selectLocstio.setgradiantcolor(color: [UIColor.garidant2 , UIColor.garidant1], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
        
    }
   
   
    func data_(data: String) {
        datepicTextfiled.text = data
    }
    

    
    @IBAction func datepicBut(_ sender: Any) {
        
        let vc = UIStoryboard(name: "AlertPopup", bundle: nil).instantiateViewController(identifier: "DatapickerVC") as! DatapickerVC
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        vc.delegate = self
        self.present(vc, animated: true)
        
    }
    
    
}
