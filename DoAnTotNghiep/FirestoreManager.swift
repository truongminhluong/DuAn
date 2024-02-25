//
//  FirestoreManager.swift
//  DoAnTotNghiep
//
//  Created by Trương Minh Lượng Jr on 21/02/2024.
//

import Foundation
import Firebase
import FirebaseFirestore

class FirestoreManager {
    static let shared = FirestoreManager()
    
    private init() {}
    
    func addUserInfo(userInfo: User) {
        let db = Firestore.firestore()
        db.collection("users").addDocument(data: userInfo.toDictionary()) { error in
            if let error = error {
                print("Error adding user data: \(error.localizedDescription)")
            } else {
                print("User data added successfully")
            }
        }
    }
}
