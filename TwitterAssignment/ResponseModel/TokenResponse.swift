//
//  TokenResponse.swift
//  TwitterAssignment
//
//  Created by Vaishnav C on 2/17/20.
//  Copyright © 2020 Vaishnav C. All rights reserved.
//

import Foundation

struct TokenResponse : Codable {
    
    let accessToken : String?
    let tokenType : String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        accessToken = try values.decodeIfPresent(String.self, forKey: .accessToken)
        tokenType = try values.decodeIfPresent(String.self, forKey: .tokenType)
    }
}
