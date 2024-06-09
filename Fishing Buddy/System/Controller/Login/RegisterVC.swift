//
//  RegisterVC.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 12/02/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import DropDown

class RegisterVC: UIViewController , datepass,UITextFieldDelegate{
    
    
    
    @IBOutlet var passtextFiled: [UITextField]!
    @IBOutlet weak var userDOBTextfiled: UITextField!
    @IBOutlet weak var genderselectFiled: UITextField!
    @IBOutlet weak var useremailTextField: UITextField!
    @IBOutlet weak var userStateTextField: UITextField!
    @IBOutlet weak var userCityTextField: UITextField!
    @IBOutlet weak var userAddressTextField: UITextField!
    @IBOutlet weak var userMobilenumTextField: UITextField!
    @IBOutlet weak var userNametextField: UITextField!
    @IBOutlet weak var becomeBuddyBut: UIButton!
    @IBOutlet var conarradius: [UIView]!
    @IBOutlet weak var genderSelectBut: UIButton!
    
    
    let dropdown = DropDown()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpdropdown(dropdown: dropdown)
        useremailTextField.delegate = self
        
        becomeBuddyBut.layer.cornerRadius = 8
        becomeBuddyBut.setgradiantcolor(color: [UIColor.garidant2 , UIColor.garidant1], startpoint:  CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 10)
        for i in conarradius {
            (i as AnyObject).layer.cornerRadius = 5
        }
        
    }
    
    
    
    @IBAction func loginButton(_ sender: Any) {
        navigate(Storybord: "Main", identifier: "LoginVC", VC: self)
    }
    
    
    @IBAction func becomebuddyAction(_ sender: Any) {
        
        if userNametextField.text?.isEmpty == true || userMobilenumTextField.text?.isEmpty == true || useremailTextField.text?.isEmpty == true || genderselectFiled.text!.isEmpty == true || userDOBTextfiled.text!.isEmpty == true || passtextFiled.first!.text!.isEmpty == true || passtextFiled.last?.text?.isEmpty == true {
            
            fallalertPopup(title: "Error", mes: "Plesae Entar The deteils", VC: self)
            
        }
        else {
            
            if !(isValidPhonenumber(Phonenumber: userMobilenumTextField.text!)) {
                fallalertPopup(title: "Error", mes: "Plesae Entar The Valid Phone Number", VC: self)
            }
            else if !(isValidEmail(useremailTextField.text!)){
                fallalertPopup(title: "Error", mes: "Plesae Entar The Valid Email", VC: self)
            }
            else if (userDOBTextfiled.text?.isEmpty == true){
                fallalertPopup(title: "Error", mes: "Plesae Select Date", VC: self)
            }
            else if (genderselectFiled.text?.isEmpty == true) {
                fallalertPopup(title: "Error", mes: "Plesae Select Gender", VC: self)
            }
            else if !(passtextFiled.first?.text == passtextFiled.last?.text) {
                fallalertPopup(title: "Error", mes: "Not Match Confirm Password", VC: self)
            }
            else {
                
                Auth.auth().createUser(withEmail: useremailTextField.text!, password: passtextFiled.last!.text!) { Success, Error in
                    
                    if let error = Error {
                        print(error.localizedDescription)
                    }
                    else {
                        
                        let User = Auth.auth().currentUser
                        
                        setCreateUserdata(id: User!.uid, name: self.userNametextField.text!, mobilenum: self.userMobilenumTextField.text!, email: self.useremailTextField.text!, password: self.passtextFiled.last!.text!, DOB: self.userDOBTextfiled.text!, gender: self.genderselectFiled.text!)
                        UserDefaults.standard.set(true, forKey: "UserIsLogin")
                        UserDefaults.standard.set(User?.email, forKey: "UserEmail")
                        navigate(Storybord: "Main", identifier: "LoginVerification", VC: self)

                    }
                    
                    
                }
                
              
                
            }
            
        }
        
    }
    
    @IBAction func passhiedBut(_ sender: UIButton) {
        let tag = sender.tag
        cilekTochangeImage(button: sender , normalImg: UIImage(systemName: "eye.slash")!, selectedImg: UIImage(systemName: "eye")!, textfiled: passtextFiled[tag])
        
    }
    
    @IBAction func genderselect(_ sender: UIButton) {
        
        dropdown.show()
        dropdown.selectionAction = {
            [unowned self] (index: Int, item: String) in
            genderselectFiled.text = item
        }
        
    }
    @IBAction func dataselectBut(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "AlertPopup", bundle: nil).instantiateViewController(identifier: "DatapickerVC") as! DatapickerVC
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        vc.delegate = self
        self.present(vc, animated: true)
        
    }
    
    
    

}

extension RegisterVC  {
    
    func setUpdropdown (dropdown: DropDown) -> DropDown {
        
        dropdown.anchorView = genderselectFiled
        dropdown.backgroundColor = .white
        dropdown.cornerRadius = 10
        dropdown.dataSource = ["Male","Female","Other"]
    return dropdown
    }
    
    func data_(data: String) {
        userDOBTextfiled.text = data
    }
    
        
    
    
    
}
