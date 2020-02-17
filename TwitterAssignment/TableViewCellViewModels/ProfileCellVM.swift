//
//  ProfileCellVM.swift
//  TwitterAssignment
//
//  Created by Vaishnav C on 2/17/20.
//  Copyright © 2020 Vaishnav C. All rights reserved.
//

import Foundation
import UIKit

class ProfileCellVM {
    
    let userName: String
    let twitterHandle:String
    let tweets: String
    let profileImage: String?
    let followingCount: Int
    let followersCount: Int
    let coverImage:String?
    let joiningDate: String
    let location:String
    let description: String
    
    init(userName: String, twitterHandle: String, tweets: String, profileImage: String?, followingCount: Int, followersCount: Int, coverImage: String?, joiningDate: String, location: String , description:String) {
        self.userName = userName
        self.twitterHandle = twitterHandle
        self.tweets = tweets
        self.profileImage = profileImage
        self.followingCount = followingCount
        self.followersCount = followersCount
        self.coverImage = coverImage
        self.joiningDate = joiningDate
        self.location = location
        self.description = description
    }
    
    func setUserInfoLabel() -> NSAttributedString {
        let output = NSMutableAttributedString()
        
        let userNameAttr = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20.0) , NSAttributedString.Key.foregroundColor: UIColor.black]
        let twitterHandleAttr = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.light) , NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let userName = NSAttributedString(string: self.userName, attributes: userNameAttr)
        let twitterHandle = NSAttributedString(string: "\n@\(self.twitterHandle)", attributes: twitterHandleAttr)
        
        let descriptionAttr = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.medium) , NSAttributedString.Key.foregroundColor: UIColor.black]
        let description = NSAttributedString(string: "\n\n @\(self.description)", attributes: descriptionAttr)
        
        output.append(userName)
        output.append(twitterHandle)
        output.append(description)
        return output
    }
    
    func setFollwersFollwingLabel() -> NSAttributedString {
        let output = NSMutableAttributedString()
        
        let keyAttr = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14.0) , NSAttributedString.Key.foregroundColor: UIColor.black]
        let valueAttr = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.light) , NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let followingNumber = NSAttributedString(string: "\(self.followingCount)", attributes: keyAttr)
        let followingLabel = NSAttributedString(string: " Following", attributes: valueAttr)
        let followersNumber = NSAttributedString(string: "  \(self.followersCount)", attributes: keyAttr)
        let followersLabel = NSAttributedString(string: " Followers", attributes: valueAttr)
        
        output.append(followingNumber)
        output.append(followingLabel)
        output.append(followersNumber)
        output.append(followersLabel)
        
        return output
    }
}

extension ProfileCellVM: CellProtocol {
    
    static func registerCell(tableView: UITableView) {
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileTableViewCell")
    }
    
    func cellInstantiate(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
        if let coverImage = coverImage {
            let url = URL(string: coverImage)
            cell.bannerImage.kf.setImage(with: url)
        }
        if let profileImage = profileImage {
            let url = URL(string: profileImage)
            cell.profileImage.kf.setImage(with: url)
        }
        cell.ProfileInfoLabel.attributedText = setUserInfoLabel()
        cell.joiningDateLabel.text = joiningDate
        cell.locationLabel.text = location
        cell.followingFollowingLabel.attributedText = setFollwersFollwingLabel()
        cell.calenderImage.image = #imageLiteral(resourceName: "calendaer")
        cell.locationImage.image = #imageLiteral(resourceName: "location")
        return cell
    }
}
