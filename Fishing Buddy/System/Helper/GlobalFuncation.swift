//
//  GlobalFuncation.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 14/02/24.
//

import Foundation
import UIKit
import FirebaseFirestore


func navigate (Storybord: String , identifier: String , VC: UIViewController) {
    let vc = UIStoryboard(name: Storybord, bundle: nil).instantiateViewController(identifier: identifier)
    VC.navigationController?.pushViewController(vc, animated: true)
}

public func present (Storybord: String , identifier: String , VC: UIViewController) {
    let vc = UIStoryboard(name: Storybord, bundle: nil).instantiateViewController(identifier: identifier)
    vc.modalPresentationStyle = .overCurrentContext
    vc.modalTransitionStyle = .crossDissolve
    VC.present(vc, animated: true)
}

func cilekTochangeImage (button: UIButton,normalImg: UIImage , selectedImg: UIImage, textfiled: UITextField) {
    if button.isSelected {
        button.setImage(normalImg, for: .normal)
        textfiled.isSecureTextEntry = false
    }
    else {
        button.setImage(selectedImg, for: .selected)
        textfiled.isSecureTextEntry = true
    }
    button.isSelected.toggle()
}


func fallalertPopup (title: String , mes: String , VC: UIViewController) {
    
    let alert = UIAlertController(title: title, message: mes, preferredStyle: .alert)
    let alertBut = UIAlertAction(title: "Try again", style: .cancel)
    alert.addAction(alertBut)
    VC.present(alert, animated: true)
}


func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
  }
  
  func isValidPassword(_ password: String) -> Bool {
    let minPasswordLength = 6
    return password.count >= minPasswordLength
  }

func isValidPhonenumber (Phonenumber: String) -> Bool {
    let phoennum = 10
    return Phonenumber.count == phoennum
}



