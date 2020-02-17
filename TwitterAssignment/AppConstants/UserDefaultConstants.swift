//
//  UserDefaultConstants.swift
//  TwitterAssignment
//
//  Created by Vaishnav C on 2/17/20.
//  Copyright © 2020 Vaishnav C. All rights reserved.
//

import Foundation

class UserDefaultConstants {
    
    static private let TOKEN = "Token"
    
    static func setToken(token:String) {
        UserDefaults.standard.set(token, forKey: TOKEN)
    }
    
    static func getToken() -> String? {
        return UserDefaults.standard.string(forKey: TOKEN)
    }
}
