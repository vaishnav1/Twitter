//
//  TweetsViewModel.swift
//  TwitterAssignment
//
//  Created by Vaishnav C on 2/17/20.
//  Copyright © 2020 Vaishnav C. All rights reserved.
//

import Foundation
import Moya
import UIKit
import RealmSwift


class TweetsViewModel {
    
    private let provider = MoyaProvider<TwitterAPI>()
    private var twitterSearchResponse: TwitterSearchResponse?
    var showAlert: ((String,String)->())?
    var reloadTable: (()->())?
    var fetchingMore = false
    var pushViewController: ((UIViewController)->())?
    var savedTweets: Results<Tweets_Realm_Model>?
    let realm = RealmResources.shared.realm
    
    
    let tableCellTypes: [CellProtocol.Type] = [TweetsCellVM.self]
    private(set) var tableCells = [CellProtocol]()
    init() {
        getToken()
        
    }
}

extension TweetsViewModel {
    
    func setUpTableViewCells() -> [CellProtocol] {
        var cellHelpers = [CellProtocol]()
        if twitterSearchResponse == nil {
            let tweetsObjects = realm.objects(Tweets_Realm_Model.self)
            for response in tweetsObjects {
                let newCell = TweetsCellVM(userName: response.userName, twitterHandle: response.twitterHandle, tweets:response.tweets, image: response.image, likeCount: response.likeCount, retweetCount: response.retweetCount, userString: response.userString)
                cellHelpers.append(newCell)
            }
            return cellHelpers
        }
        for response in twitterSearchResponse?.statuses ?? [Statuse]() {
            let newCell = TweetsCellVM(userName: response.user?.name ?? "", twitterHandle: response.user?.screenName ?? "", tweets: response.text ?? "", image: response.entities?.media?.first?.mediaUrl, likeCount: response.favoriteCount ?? 0, retweetCount: response.retweetCount ?? 0, userString: response.user?.profileImageUrl ?? "")
            cellHelpers.append(newCell)
        }
        return cellHelpers
    }
    
    func assignTableViewCells() {
        self.tableCells = self.setUpTableViewCells()
    }
    
}


//MARK: API calls
extension TweetsViewModel {
    
    func getToken() {
        if (UserDefaultConstants.getToken() != nil) {
            return
        }
        let header = ["Authorization" : "Basic \(TwitterConstants.getEncodedKey())" , TwitterConstants.CONTENT_TYPE:"application/x-www-form-urlencoded;charset=UTF-8"]
        let params = [TwitterConstants.GRANT_TYPE:"client_credentials"]
        provider.request(.getToken(header: header, params: params)) { (Result) in
            switch Result{
            case .success(let response):
                if Helper.isStatusOK(status: response.statusCode){
                    do {
                        let tokenResponse = try response.map(TokenResponse.self)
                        guard let accessToken = tokenResponse.accessToken else {return}
                        UserDefaultConstants.setToken(token:accessToken)
                    } catch (let error) {
                        self.showAlert?("Oops",error.localizedDescription)
                    }
                }else{
                    self.showAlert?("Oops","Token expired!")
                }
                break
            case .failure(let error):
                self.showAlert?("Oops",error.localizedDescription)
            }
        }
    }
    
    func checkTokenIssue() -> Bool {
        if (UserDefaultConstants.getToken() != nil) {
            return true
        } else {
            self.showAlert?("Oops", "Please check your internet connection and pull to reload")
            return false
        }
    }
    
    func getPaginatedData() {
        if twitterSearchResponse == nil {
            return
        }
        fetchingMore = true
        getNextPageResponse()
    }
    
    func getNextPageResponse(){
        if (UserDefaultConstants.getToken() == nil) {
            getToken()
            return
        }
        let header = ["Authorization" : "Bearer \(UserDefaultConstants.getToken() ?? "")" ,
            TwitterConstants.CONTENT_TYPE : "application/x-www-form-urlencoded"
        ]
        guard let query = twitterSearchResponse?.searchMetadata?.query else {
            return
        }
        guard let count = twitterSearchResponse?.searchMetadata?.count else {
            return
        }
        guard var maxID = twitterSearchResponse?.searchMetadata?.maxIdStr else {
            return
        }
        maxID = "?max_id=" + maxID
        let newCount = "\(count)" + maxID
        print(newCount)
        let params = ["q":query ,
                      "result_type":"mixed",
                      "count":"\(newCount)",
            "include_entities":"1"
        ]
        provider.request(.getNextTwitterPaginatedResponse(header: header, params: params)) { (Result) in
            switch Result {
            case .success(let response):
                print(response.statusCode)
                do{
                    let searchResponse = try response.map(TwitterSearchResponse.self)
                    for status in searchResponse.statuses ?? [Statuse]() {
                        self.twitterSearchResponse?.statuses?.append(status)
                    }
                    self.twitterSearchResponse?.searchMetadata = searchResponse.searchMetadata
                    self.fetchingMore = false
                    self.reloadTable?()
                }catch(let error) {self.showAlert?("Oops",error.localizedDescription)}
                
            case .failure(let error):
                self.showAlert?("Oops",error.localizedDescription)
            }
        }
        
    }
    
    func getSearchResponse(searchFor:String , limitPerCall:Int) {
        if (UserDefaultConstants.getToken() == nil) {
            getToken()
            return
        }
        let header = ["Authorization" : "Bearer \(UserDefaultConstants.getToken() ?? "")" ,
            TwitterConstants.CONTENT_TYPE : "application/x-www-form-urlencoded"
        ]
        
        let params = ["q":"\(searchFor)" ,
            "result_type":"mixed",
            "count":"\(limitPerCall)"
        ]
        provider.request(.getSearchResponse(header: header, params: params)) { (Result) in
            switch Result{
            case .success(let response):
                if Helper.isStatusOK(status: response.statusCode) {
                    
                    do {
                        let searchResponse = try response.map(TwitterSearchResponse.self)
                        self.twitterSearchResponse = searchResponse
                        self.savedTweets = self.realm.objects(Tweets_Realm_Model.self)
                        
                        self.reloadTable?()
                    } catch (let error) {
                        self.showAlert?("Oops",error.localizedDescription)
                    }
                } else {
                    print("Failed")
                }
                break
            case .failure(let error):
                self.showAlert?("Oops",error.localizedDescription)
                break
            }
        }
    }
}

extension TweetsViewModel {
    
    func moveToProfileScreen(indexPath:Int) {
        if let user = twitterSearchResponse?.statuses?[indexPath].user {
            let viewModel = ProfileViewModel(userInfo: user)
            let viewController = ProfileViewController(viewModel: viewModel)
            pushViewController?(viewController)
        }
    }
    
    func saveToRealm() {
        guard let status = self.twitterSearchResponse?.statuses else{return}
        let realm = RealmResources.shared.realm
        let tweetsObject = realm.objects(Tweets_Realm_Model.self)
        
        try! realm.write {
            realm.delete(tweetsObject)
            
        }
        for response in status {
            let newEntry = Tweets_Realm_Model(userName: response.user?.name ?? "", twitterHandle: response.user?.screenName ?? "", tweets: response.text ?? "", image: response.entities?.media?.first?.mediaUrl ?? "", likeCount: response.favoriteCount ?? 0, retweetCount: response.retweetCount ?? 0, userString: response.user?.profileImageUrl ?? "")
            RealmResources.shared.create(newEntry)
        }
    }
}

