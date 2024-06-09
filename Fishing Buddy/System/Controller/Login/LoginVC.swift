//
//  LoginVC.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 12/02/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestoreInternal

class LoginVC: UIViewController {
    
   
    
    @IBOutlet weak var passwordTextFiled: UITextField!
    
    @IBOutlet weak var emailTextFIled: UITextField!
    @IBOutlet weak var loginBut: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.setValue(false, forKey: "UserIsLogin")
    }
    
    
    @IBAction func loginBut(_ sender: UIButton) {
        
        if passwordTextFiled.text == "" || emailTextFIled.text == "" {
            fallalertPopup(title: "Error", mes: "Please entar the email and Password", VC: self)
        }
        else {
            if !(isValidEmail(emailTextFIled.text!)) || !(isValidPassword(passwordTextFiled.text!)) {
                fallalertPopup(title: "Error", mes: "Your Email and Password is not valid", VC: self)
                
            }
            else {
                Auth.auth().signIn(withEmail: emailTextFIled.text!, password: passwordTextFiled.text!) { succes, error in
                    if let ero = error as? NSError{
                        print("Error --- UserIs not Login")
                        print(error!.localizedDescription)
                    }
                    else
                    {
                        print("userIslogin")
                        let userinfo = Auth.auth().currentUser
                        let email = userinfo?.email!
                        UserDefaults.standard.set(true, forKey: "UserIsLogin")
                        UserDefaults.standard.setValue(email, forKey: "UserEmail")
                        setUserLogindata(id: userinfo!.uid , email: self.emailTextFIled.text!, pass: self.passwordTextFiled.text!)
                        navigate(Storybord: "Tabbar", identifier: "TabbarVC", VC: self)
                        
                    }
                    
                }
                
                
            }
        }
        
        
    }
    
    
    @IBAction func registerButton(_ sender: Any) {
        navigate(Storybord: "Main", identifier: "RegisterVC", VC: self)
    }
    
    
}



extension LoginVC {
    
    
  
  
    
    func setdidload() {
        loginBut.setgradiantcolor(color: [UIColor.garidant2 , UIColor.garidant1], startpoint:  CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
        
    }
    
    
}
