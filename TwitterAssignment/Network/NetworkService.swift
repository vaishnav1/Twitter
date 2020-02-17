//
//  NetworkService.swift
//  TwitterAssignment
//
//  Created by Vaishnav C on 2/17/20.
//  Copyright © 2020 Vaishnav C. All rights reserved.
//

import Foundation
import Moya

enum TwitterAPI {
    case getToken(header: [String:String] , params: [String:Any])
    case getSearchResponse(header: [String:String] , params: [String:Any])
    case getNextTwitterPaginatedResponse(header: [String:String] , params: [String:Any])
    case getUserTweets(header: [String:String] , params: [String:Any])
}

extension TwitterAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: APIConstants.TWITTER_BASE_URL)!
    }
    
    var path: String {
        switch self {
        case .getToken:
            return "/oauth2/token"
        case .getSearchResponse , .getNextTwitterPaginatedResponse:
            return "1.1/search/tweets.json"
        case .getUserTweets:
            return "/1.1/statuses/user_timeline.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getToken:
            return .post
        case .getSearchResponse , .getNextTwitterPaginatedResponse , .getUserTweets:
            return .get
            
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case let .getToken(header: _, params: params):
            return .requestParameters(parameters: params, encoding:URLEncoding.default)
        case .getSearchResponse( _, let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .getNextTwitterPaginatedResponse( _, let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .getUserTweets(_, let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self{
        case .getToken(let header, _):
            return header
        case .getSearchResponse(let header, _):
            return header
        case .getNextTwitterPaginatedResponse(let header, _):
            return header
        case .getUserTweets(let header,_):
            return header
        }
    }
}

enum ResponseCode:Int {
    case success = 200
}
