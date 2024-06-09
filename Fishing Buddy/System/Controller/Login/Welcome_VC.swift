//
//  Welcome_VC.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 12/02/24.
//

import UIKit

class Welcome_VC: UIViewController {

    @IBOutlet weak var hookupbut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hookupbut.layer.cornerRadius = hookupbut.frame.height / 2
        
    }
    

    @IBAction func welcomeBut(_ sender: Any) {
        let vc = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(identifier: "TabbarVC") 
        self.navigationController?.pushViewController(vc, animated: true)
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
