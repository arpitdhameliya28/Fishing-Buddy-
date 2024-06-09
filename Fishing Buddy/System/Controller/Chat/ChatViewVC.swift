//
//  ChatViewVC.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 15/02/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore


class ChatViewVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    

    @IBOutlet weak var mes_filed: UITextField!
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTextFiled: UIView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userProfileImage: UIImageView!
    var receverUid = String()
    var usernaem = ""
    var userimage = UIImage()
    var usermessageModel: Usermessage!
    var userchat = [Usermessage]()
    var sorteddata = [Usermessage]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UsermessGet()
        scrollToBottom()
        self.userName.text = usernaem
        self.userProfileImage.image = userimage
        userProfileImage.layer.cornerRadius = userProfileImage.frame.height / 2
        messageTextFiled.layer.cornerRadius = 12
        messageTextFiled.layer.borderWidth = 1
        messageTextFiled.layer.borderColor = UIColor.systemGray4.cgColor
        
        mes_filed.delegate = self
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UINib(nibName: "ChatView_cell", bundle: nil), forCellReuseIdentifier: "ChatView_cell")
        tableview.register(UINib(nibName: "Chatview_cell2", bundle: nil), forCellReuseIdentifier: "Chatview_cell2")
        
    }
    

   
    @IBAction func backBut(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendBut(_ sender: Any) {
        
        if (mes_filed.text?.isEmpty == false) {
            Setusermessage(senderId: CurrentUserUid ,message: mes_filed.text!, reseiver: receverUid, realtime: Date())
        }else{
            print("no message type")
        }
        UsermessGet()
        self.tableview.reloadData()
        self.mes_filed.text = ""
        scrollToBottom()
        }
   
   

}


extension ChatViewVC {
    
    func UsermessGet() {
        
        let db = Firestore.firestore()
        let collection = db.collection("Usermessage")
        
        collection.whereField(CurrentUserUid, isEqualTo: CurrentUserUid).whereField(receverUid, isEqualTo: receverUid).addSnapshotListener { querySnapshot, erro in
            
            if let error = erro as? NSError {
                print(error.localizedDescription)
            }
            else {
                let data = querySnapshot?.documents
                self.userchat.removeAll()
                for arr in data! {
                    self.usermessageModel = Usermessage(dic: arr.data())
                    self.userchat.append(self.usermessageModel)
                }
              //  print(self.userchat)
                self.tableview.reloadData()
              //  self.userchat.sort(by: { $0.realtime < $1.realtime })
                
            }
            
        }
        
    }

    
    func scrollToBottom(){
        if userchat.isEmpty == false {
            DispatchQueue.main.async {
                let indexpath = IndexPath(row: self.userchat.count - 1, section: 0)
                self.tableview.scrollToRow(at: indexpath, at: .bottom, animated: true)
            }
        }
        else {
            print("no chat")
        }
        
    }
    
  // MARK: TextField deleget Method
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        messageTextFiled.layer.borderColor = UIColor.buttoncolor.cgColor
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.text!.count == 0 && string.count >= 0  {
            sendButton.setImage(UIImage(named: "sendbut"), for: .normal)
        }
        else if textField.text!.count == 1 && string.count < 1{
            sendButton.setImage(UIImage(named: "sendbut 1"), for: .normal)

        }
    
        return true
        
    }
    
    //MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userchat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //    userchat.sort { $0.realtime > $1.realtime }
      //  print(userchat)
        var data = userchat[indexPath.row]
        if data.senderId ==  CurrentUserUid {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatView_cell") as! ChatView_cell
            cell.messageLbl.text = data.message
            return cell
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Chatview_cell2") as! Chatview_cell2
            cell.mes_text.text = data.message
            return cell
        }
      
    }
    
  
    
}
