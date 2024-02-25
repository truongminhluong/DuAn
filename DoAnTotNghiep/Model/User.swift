//
//  User.swift
//  DoAnTotNghiep
//
//  Created by Trương Minh Lượng Jr on 19/02/2024.
//

import Foundation

struct User {
    var uid: String
    var email: String
    var password: String
    var name: String
    var userName: String
    var birthdate: String
    
    func toDictionary() -> [String: Any] {
        return ["uid": uid,
                "email": email,
                "password": password,
                "name": name,
                "userName": userName,
                "birthdate": birthdate
        ]
    }
    
}
