//
//  Tweets.swift
//  TwitterAssignment
//
//  Created by Vaishnav C on 2/17/20.
//  Copyright © 2020 Vaishnav C. All rights reserved.
//

import Foundation

struct UserTweets : Codable {
    
    let createdAt : String?
    let entities : Entity?
    let favoriteCount : Int?
    let favorited : Bool?
    let id : Int?
    let idStr : String?
    let isQuoteStatus : Bool?
    let lang : String?
    let possiblySensitive : Bool?
    let retweetCount : Int?
    let retweeted : Bool?
    let source : String?
    let text : String?
    let truncated : Bool?
    let user : User?
    
    enum CodingKeys: String, CodingKey {
        
        
        case createdAt = "created_at"
        case entities = "entities"
        case favoriteCount = "favorite_count"
        case favorited = "favorited"
        case id = "id"
        case idStr = "id_str"
        case isQuoteStatus = "is_quote_status"
        case lang = "lang"
        case possiblySensitive = "possibly_sensitive"
        case retweetCount = "retweet_count"
        case retweeted = "retweeted"
        case source = "source"
        case text = "text"
        case truncated = "truncated"
        case user = "user"
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do{
            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
            entities = try values.decodeIfPresent(Entity.self, forKey: .entities)
            favoriteCount = try values.decodeIfPresent(Int.self, forKey: .favoriteCount)
            favorited = try values.decodeIfPresent(Bool.self, forKey: .favorited)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            idStr = try values.decodeIfPresent(String.self, forKey: .idStr)
            isQuoteStatus = try values.decodeIfPresent(Bool.self, forKey: .isQuoteStatus)
            lang = try values.decodeIfPresent(String.self, forKey: .lang)
            possiblySensitive = try values.decodeIfPresent(Bool.self, forKey: .possiblySensitive)
            retweetCount = try values.decodeIfPresent(Int.self, forKey: .retweetCount)
            retweeted = try values.decodeIfPresent(Bool.self, forKey: .retweeted)
            source = try values.decodeIfPresent(String.self, forKey: .source)
            text = try values.decodeIfPresent(String.self, forKey: .text)
            truncated = try values.decodeIfPresent(Bool.self, forKey: .truncated)
            user = try values.decodeIfPresent(User.self, forKey: .user)
            
        }catch (let error){
            throw error
        }
    }
}
