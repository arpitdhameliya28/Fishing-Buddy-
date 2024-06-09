//
//  ChatVC.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 15/02/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableview: UITableView!
    
    static var userimage = ["1","2","3","4","5","6","7","8","9","10","11"]
    
    static var username = ["Princh","@b$!_07✨🍂","Vivek💫","Bhargav🔗","Cintu","Abhi","Priyesha🫀","jeni_koldiya","Drshti","Priyansh","Vanch","kush_vekariya_","Kally Montoz","Pranav"]
    var thredmodel = [usermodel]()
    var model: usermodel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userdataGet()
    
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UINib(nibName: "Chat_profile_cell", bundle: nil), forCellReuseIdentifier: "Chat_profile_cell")
        
    }
    
    
    

}


extension ChatVC {
    
    func userdataGet() {
        let db = Firestore.firestore()
        let collection = db.collection("UserInfo")
//        let email = UserDefaults.standard.string(forKey: "UserEmail")
        collection.whereField("Email", notIn : [Auth.auth().currentUser?.email]).getDocuments { querysnapshot, erro in
        
            if let err = erro as? NSError {
                print(err.localizedDescription)
            }
            else {
                
                let arr = querysnapshot?.documents
                for i in arr! {
                    self.model = usermodel(dic: i.data())
                    self.thredmodel.append(self.model)
                  
                }
                print(self.thredmodel)
                self.tableview.reloadData()
            }
        }
       
    }

    
    
    //MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thredmodel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Chat_profile_cell", for: indexPath) as! Chat_profile_cell
        cell.profileimage.image = UIImage(named:ChatVC.userimage[indexPath.row])
        var index = thredmodel[indexPath.row]
        cell.userName.text = index.email
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let vc = UIStoryboard(name: "Chat", bundle: nil).instantiateViewController(identifier: "ChatViewVC") as! ChatViewVC
        self.navigationController?.pushViewController(vc, animated: true)
        
        var index = thredmodel[indexPath.row]
        vc.receverUid = index.id
        print(vc.receverUid)
        vc.usernaem = index.email
        vc.userimage = UIImage(named: ChatVC.userimage[indexPath.row])!
        
    }
    
}
