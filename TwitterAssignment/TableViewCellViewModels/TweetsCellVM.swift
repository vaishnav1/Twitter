//
//  TweetsCellVM.swift
//  TwitterAssignment
//
//  Created by Vaishnav C on 2/17/20.
//  Copyright © 2020 Vaishnav C. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher


class TweetsCellVM {
    
    let userName: String
    let twitterHandle:String
    let tweets: String
    let image: String?
    let likeCount: Int
    let retweetCount: Int
    let userString: String?
    
    init(userName: String, twitterHandle: String, tweets: String, image: String?, likeCount: Int, retweetCount: Int , userString: String) {
        self.userName = userName
        self.twitterHandle = twitterHandle
        self.tweets = tweets
        self.image = image
        self.likeCount = likeCount
        self.retweetCount = retweetCount
        self.userString = userString
    }
    
    func setUserInfoLabel() -> NSAttributedString {
        let output = NSMutableAttributedString()
        
        let userNameAttr = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20.0) , NSAttributedString.Key.foregroundColor: UIColor.black]
        let twitterHandleAttr = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20.0, weight: UIFont.Weight.light) , NSAttributedString.Key.foregroundColor: UIColor.gray]
        
        let userName = NSAttributedString(string: self.userName, attributes: userNameAttr)
        let twitterHandle = NSAttributedString(string: "  @\(self.twitterHandle)", attributes: twitterHandleAttr)
        
        output.append(userName)
        output.append(twitterHandle)
        return output
    }
    
    func setupTweets() -> NSAttributedString{
        let attributedString = NSMutableAttributedString(string:tweets)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.medium), range: NSMakeRange(0, attributedString.length))
        
        return attributedString
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}

extension TweetsCellVM: CellProtocol {
    
    static func registerCell(tableView: UITableView) {
        tableView.register(TweetsTableViewCell.self, forCellReuseIdentifier: "TweetsTableViewCell")
    }
    
    func cellInstantiate(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetsTableViewCell", for: indexPath) as! TweetsTableViewCell
        cell.userInfoLabel.attributedText = setUserInfoLabel()
        cell.tweetsLabel.attributedText = self.setupTweets()
        if let imageString = image {
            cell.imageContainerHeightAnchor.isActive = true
            let url = URL(string: imageString)
            cell.tweetImage.kf.setImage(with: url)
            cell.imageView?.image = cell.imageView?.image?.kf.normalized
        } else {
            cell.imageContainerHeightAnchor.isActive = false
        }
        if let imageString = userString {
            let url = URL(string: imageString)
            cell.profileImage.kf.setImage(with: url)
        }
        cell.retweetButton.setTitle(Double(self.retweetCount).kmFormatted, for: .normal)
        cell.likeButton.setTitle(Double(self.likeCount).kmFormatted, for: .normal)
        cell.likeButton.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: .normal)
        cell.retweetButton.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: .normal)
        cell.selectionStyle = .none
        return cell
    }
}

