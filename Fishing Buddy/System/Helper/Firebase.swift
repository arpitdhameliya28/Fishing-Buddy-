//
//  Firebase.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 20/02/24.
//

import Foundation
import UIKit
import FirebaseFirestore


func setUserLogindata (id: String , email: String , pass: String) {
    
    let db = Firestore.firestore()
    
    let coll = db.collection("UserInfo")
    coll.document(email).setData([
        "Id": id,
        "Email": email,
        "Password": pass,
    ])
    
}

func setCreateUserdata (id: String , name: String , mobilenum: String , email:String ,password: String , DOB: String , gender: String ) {
    
    Firestore.firestore().collection("UserInfo").document(email).setData([
    
        "Id": id,
        "Email": email,
        "Password": password,
        "Name": name,
        "MobileNumber": mobilenum,
        "DOB": DOB
    
    ])
    
}


func Setusermessage (senderId: String , message: String , reseiver: String , realtime : Date) {
    
    let db = Firestore.firestore()
    
    let collection = db.collection("Usermessage")
    collection.document().setData([

        "message": message,
         CurrentUserUid: senderId,
        "sender": senderId,
        "reseiver": reseiver,
        reseiver : reseiver,
        "realtime": realtime
    ])
}
