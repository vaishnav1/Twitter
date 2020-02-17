//
//  APIConstants.swift
//  TwitterAssignment
//
//  Created by Vaishnav C on 2/17/20.
//  Copyright © 2020 Vaishnav C. All rights reserved.
//

import Foundation

struct APIConstants {
    
    static let TWITTER_BASE_URL = "https://api.twitter.com/"
}

struct TwitterConstants {
    
    private static let API_KEY = "yD7KaBsAJSjqeOLXTucW2pVCz"
    private static let API_SECRET_KEY = "kQdZMLEPXja7WkDsqRcHYUSFhl9z0lp6pbLzBJScgynrYQgkMF"
    static let CONTENT_TYPE = "Content-Type"
    static let GRANT_TYPE = "grant_type"
    static func getApiKey() -> String {
        return API_KEY
    }
    
    static func getApiSecretKey()-> String {
        return API_SECRET_KEY
    }
    
    static func getEncodedKey() -> String {
        let uRLEncodedAPIKey = Helper.convertToURLEncoding(string: API_KEY)
        let uRLEncodedAPISecretKey = Helper.convertToURLEncoding(string: API_SECRET_KEY)
        let encodedKey = "\(uRLEncodedAPIKey):\(uRLEncodedAPISecretKey)"
        return encodedKey.toBase64()
    }
}
