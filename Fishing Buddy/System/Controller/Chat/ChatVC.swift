//
//  ChatVC.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 15/02/24.
//

import UIKit

class ChatVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableview: UITableView!
    
    static var userimage = ["1","2","3","4","5","6","7","8","9","10","11"]
    
    static var username = ["Princh","@b$!_07✨🍂","Vivek💫","Bhargav🔗","Cintu","Abhi","Priyesha🫀","jeni_koldiya","Drshti","Priyansh","Vanch","kush_vekariya_","Kally Montoz","Pranav"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UINib(nibName: "Chat_profile_cell", bundle: nil), forCellReuseIdentifier: "Chat_profile_cell")
    }
    

    

}


extension ChatVC {
    
    //MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ChatVC.userimage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Chat_profile_cell", for: indexPath) as! Chat_profile_cell
        cell.profileimage.image = UIImage(named:ChatVC.userimage[indexPath.row])
        cell.userName.text = ChatVC.username[indexPath.row]
        
        return cell
    }
    
    
}
