//
//  ResponseModel.swift
//  TwitterAssignment
//
//  Created by Vaishnav C on 2/17/20.
//  Copyright © 2020 Vaishnav C. All rights reserved.
//

import Foundation

struct TwitterSearchResponse : Codable {
    
    var searchMetadata : SearchMetadata?
    var statuses : [Statuse]?
    
    enum CodingKeys: String, CodingKey {
        case searchMetadata = "search_metadata"
        case statuses = "statuses"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            searchMetadata = try values.decodeIfPresent(SearchMetadata.self, forKey: .searchMetadata)
            statuses = try values.decodeIfPresent([Statuse].self, forKey: .statuses)
        } catch(let error)
        {
            throw error}
    }
}

struct Statuse : Codable {
    
    let createdAt : String?
    let entities : Entity?
    let favoriteCount : Int?
    let id : Int?
    let lang : String?
    let metadata : Metadata?
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
        case id = "id"
        case lang = "lang"
        case metadata = "metadata"
        case retweetCount = "retweet_count"
        case retweeted = "retweeted"
        case source = "source"
        case text = "text"
        case truncated = "truncated"
        case user = "user"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        entities = try values.decodeIfPresent(Entity.self, forKey: .entities)
        favoriteCount = try values.decodeIfPresent(Int.self, forKey: .favoriteCount)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        lang = try values.decodeIfPresent(String.self, forKey: .lang)
        metadata = try values.decodeIfPresent(Metadata.self, forKey: .metadata)
        retweetCount = try values.decodeIfPresent(Int.self, forKey: .retweetCount)
        retweeted = try values.decodeIfPresent(Bool.self, forKey: .retweeted)
        source = try values.decodeIfPresent(String.self, forKey: .source)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        truncated = try values.decodeIfPresent(Bool.self, forKey: .truncated)
        user =  try values.decodeIfPresent(User.self, forKey: .user)
    }
    
}

struct User : Codable {
    
    let createdAt : String?
    let defaultProfile : Bool?
    let defaultProfileImage : Bool?
    let descriptionField : String?
    let favouritesCount : Int?
    let followersCount : Int?
    let friendsCount : Int?
    let geoEnabled : Bool?
    let hasExtendedProfile : Bool?
    let id : Int?
    let idStr : String?
    let isTranslationEnabled : Bool?
    let isTranslator : Bool?
    let listedCount : Int?
    let location : String?
    let name : String?
    let profileBackgroundColor : String?
    let profileBackgroundImageUrl : String?
    let profileBackgroundImageUrlHttps : String?
    let profileBackgroundTile : Bool?
    let profileBannerUrl : String?
    let profileImageUrl : String?
    let profileImageUrlHttps : String?
    let profileLinkColor : String?
    let profileSidebarBorderColor : String?
    let profileSidebarFillColor : String?
    let profileTextColor : String?
    let profileUseBackgroundImage : Bool?
    let protectedField : Bool?
    let screenName : String?
    let statusesCount : Int?
    let translatorType : String?
    let url : String?
    let verified : Bool?
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case defaultProfile = "default_profile"
        case defaultProfileImage = "default_profile_image"
        case descriptionField = "description"
        case favouritesCount = "favourites_count"
        case followersCount = "followers_count"
        case friendsCount = "friends_count"
        case geoEnabled = "geo_enabled"
        case hasExtendedProfile = "has_extended_profile"
        case id = "id"
        case idStr = "id_str"
        case isTranslationEnabled = "is_translation_enabled"
        case isTranslator = "is_translator"
        case listedCount = "listed_count"
        case location = "location"
        case name = "name"
        case profileBackgroundColor = "profile_background_color"
        case profileBackgroundImageUrl = "profile_background_image_url"
        case profileBackgroundImageUrlHttps = "profile_background_image_url_https"
        case profileBackgroundTile = "profile_background_tile"
        case profileBannerUrl = "profile_banner_url"
        case profileImageUrl = "profile_image_url"
        case profileImageUrlHttps = "profile_image_url_https"
        case profileLinkColor = "profile_link_color"
        case profileSidebarBorderColor = "profile_sidebar_border_color"
        case profileSidebarFillColor = "profile_sidebar_fill_color"
        case profileTextColor = "profile_text_color"
        case profileUseBackgroundImage = "profile_use_background_image"
        case protectedField = "protected"
        case screenName = "screen_name"
        case statusesCount = "statuses_count"
        case translatorType = "translator_type"
        case url = "url"
        case verified = "verified"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do{
            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
            defaultProfile = try values.decodeIfPresent(Bool.self, forKey: .defaultProfile)
            defaultProfileImage = try values.decodeIfPresent(Bool.self, forKey: .defaultProfileImage)
            descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
            favouritesCount = try values.decodeIfPresent(Int.self, forKey: .favouritesCount)
            followersCount = try values.decodeIfPresent(Int.self, forKey: .followersCount)
            friendsCount = try values.decodeIfPresent(Int.self, forKey: .friendsCount)
            geoEnabled = try values.decodeIfPresent(Bool.self, forKey: .geoEnabled)
            hasExtendedProfile = try values.decodeIfPresent(Bool.self, forKey: .hasExtendedProfile)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            idStr = try values.decodeIfPresent(String.self, forKey: .idStr)
            isTranslationEnabled = try values.decodeIfPresent(Bool.self, forKey: .isTranslationEnabled)
            isTranslator = try values.decodeIfPresent(Bool.self, forKey: .isTranslator)
            listedCount = try values.decodeIfPresent(Int.self, forKey: .listedCount)
            location = try values.decodeIfPresent(String.self, forKey: .location)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            profileBackgroundColor = try values.decodeIfPresent(String.self, forKey: .profileBackgroundColor)
            profileBackgroundImageUrl = try values.decodeIfPresent(String.self, forKey: .profileBackgroundImageUrl)
            profileBackgroundImageUrlHttps = try values.decodeIfPresent(String.self, forKey: .profileBackgroundImageUrlHttps)
            profileBackgroundTile = try values.decodeIfPresent(Bool.self, forKey: .profileBackgroundTile)
            profileBannerUrl = try values.decodeIfPresent(String.self, forKey: .profileBannerUrl)
            profileImageUrl = try values.decodeIfPresent(String.self, forKey: .profileImageUrl)
            profileImageUrlHttps = try values.decodeIfPresent(String.self, forKey: .profileImageUrlHttps)
            profileLinkColor = try values.decodeIfPresent(String.self, forKey: .profileLinkColor)
            profileSidebarBorderColor = try values.decodeIfPresent(String.self, forKey: .profileSidebarBorderColor)
            profileSidebarFillColor = try values.decodeIfPresent(String.self, forKey: .profileSidebarFillColor)
            profileTextColor = try values.decodeIfPresent(String.self, forKey: .profileTextColor)
            profileUseBackgroundImage = try values.decodeIfPresent(Bool.self, forKey: .profileUseBackgroundImage)
            protectedField = try values.decodeIfPresent(Bool.self, forKey: .protectedField)
            screenName = try values.decodeIfPresent(String.self, forKey: .screenName)
            statusesCount = try values.decodeIfPresent(Int.self, forKey: .statusesCount)
            translatorType = try values.decodeIfPresent(String.self, forKey: .translatorType)
            url = try values.decodeIfPresent(String.self, forKey: .url)
            verified = try values.decodeIfPresent(Bool.self, forKey: .verified)
            
        }catch (let error){
            throw error
        }
    }
    
}


struct Entity : Codable {
    let media: [Media]?
    
    enum CodingKeys: String, CodingKey {
        case media = "media"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do{
            media = try values.decodeIfPresent([Media].self, forKey: .media)
        }catch(let error ){
            throw error
        }
    }
}


import Foundation

struct Metadata : Codable {
    
    let isoLanguageCode : String?
    let resultType : String?
    
    enum CodingKeys: String, CodingKey {
        case isoLanguageCode = "iso_language_code"
        case resultType = "result_type"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isoLanguageCode = try values.decodeIfPresent(String.self, forKey: .isoLanguageCode)
        resultType = try values.decodeIfPresent(String.self, forKey: .resultType)
    }
    
}

struct Media : Codable {
    
    
    let displayUrl : String?
    let expandedUrl : String?
    let id : Int?
    let idStr : String?
    let indices : [Int]?
    let mediaUrl : String?
    let mediaUrlHttps : String?
    let sourceStatusId : Int?
    let sourceStatusIdStr : String?
    let sourceUserId : Int?
    let sourceUserIdStr : String?
    let type : String?
    let url : String?
    
    
    enum CodingKeys: String, CodingKey {
        case displayUrl = "display_url"
        case expandedUrl = "expanded_url"
        case id = "id"
        case idStr = "id_str"
        case indices = "indices"
        case mediaUrl = "media_url"
        case mediaUrlHttps = "media_url_https"
        case sourceStatusId = "source_status_id"
        case sourceStatusIdStr = "source_status_id_str"
        case sourceUserId = "source_user_id"
        case sourceUserIdStr = "source_user_id_str"
        case type = "type"
        case url = "url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        displayUrl = try values.decodeIfPresent(String.self, forKey: .displayUrl)
        expandedUrl = try values.decodeIfPresent(String.self, forKey: .expandedUrl)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        idStr = try values.decodeIfPresent(String.self, forKey: .idStr)
        indices = try values.decodeIfPresent([Int].self, forKey: .indices)
        mediaUrl = try values.decodeIfPresent(String.self, forKey: .mediaUrl)
        mediaUrlHttps = try values.decodeIfPresent(String.self, forKey: .mediaUrlHttps)
        sourceStatusId = try values.decodeIfPresent(Int.self, forKey: .sourceStatusId)
        sourceStatusIdStr = try values.decodeIfPresent(String.self, forKey: .sourceStatusIdStr)
        sourceUserId = try values.decodeIfPresent(Int.self, forKey: .sourceUserId)
        sourceUserIdStr = try values.decodeIfPresent(String.self, forKey: .sourceUserIdStr)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }
}


struct SearchMetadata : Codable {
    
    let completedIn : Double?
    let count : Int?
    let maxId : Int?
    let maxIdStr : String?
    let nextResults : String?
    let query : String?
    let refreshUrl : String?
    let sinceId : Int?
    let sinceIdStr : String?
    
    enum CodingKeys: String, CodingKey {
        case completedIn = "completed_in"
        case count = "count"
        case maxId = "max_id"
        case maxIdStr = "max_id_str"
        case nextResults = "next_results"
        case query = "query"
        case refreshUrl = "refresh_url"
        case sinceId = "since_id"
        case sinceIdStr = "since_id_str"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        completedIn = try values.decodeIfPresent(Double.self, forKey: .completedIn)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        maxId = try values.decodeIfPresent(Int.self, forKey: .maxId)
        maxIdStr = try values.decodeIfPresent(String.self, forKey: .maxIdStr)
        nextResults = try values.decodeIfPresent(String.self, forKey: .nextResults)
        query = try values.decodeIfPresent(String.self, forKey: .query)
        refreshUrl = try values.decodeIfPresent(String.self, forKey: .refreshUrl)
        sinceId = try values.decodeIfPresent(Int.self, forKey: .sinceId)
        sinceIdStr = try values.decodeIfPresent(String.self, forKey: .sinceIdStr)
    }
}
