//
//  DatapickerVC.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 13/02/24.
//

import UIKit

protocol datepass {
    func data_ (data: String)
}

class DatapickerVC: UIViewController {

    @IBOutlet weak var view_: UIView!
    
    @IBOutlet weak var selectButOul: UIButton!
    @IBOutlet weak var datepicker: UIDatePicker!
    let DateFormet = DateFormatter()
    var delegate: datepass?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectButOul.layer.cornerRadius = 15
        view_.layer.cornerRadius = 20
        view_.layer.shadowColor = UIColor.black.cgColor
        view_.layer.shadowOpacity = 1
        view_.layer.shadowRadius = 15
       
        
    }
    
    
    @IBAction func cancelBut(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    @IBAction func selectBut(_ sender: Any) {
        DateFormet.dateFormat = "dd / MM / YYYY"
        let date = DateFormet.string(from: datepicker.date)
        UserDefaults.standard.setValue(date, forKey: "DOB")
        print(date)
        delegate?.data_(data: date)
        dismiss(animated: true)
    }
    


}
