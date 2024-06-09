//
//  Firebase Model.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 21/02/24.
//

import Foundation


struct usermodel {
    
    var email = ""
    var id = ""
    
    
    init(dic:[String: Any]) {
        self.email = dic["Email"] as? String ?? "0"
        self.id = dic["Id"] as? String ?? "0"
    }
    
}


struct Usermessage {
    
    var message = ""
    var senderId = ""
    var reseiverId = ""
    var realtime: Date
    init(dic: [String:Any]) {
        self.message = dic["message"] as? String ?? ""
        self.senderId = dic["sender"] as? String ?? ""
        self.reseiverId = dic["reseiver"] as? String ?? ""
        self.realtime = dic["realtime"] as? Date ?? Date()
    }
    
}
