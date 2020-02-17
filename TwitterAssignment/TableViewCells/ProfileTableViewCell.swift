//
//  ProfileTableViewCell.swift
//  TwitterAssignment
//
//  Created by Vaishnav C on 2/17/20.
//  Copyright © 2020 Vaishnav C. All rights reserved.
//

import Foundation
import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        initViews()
    }
    
    var profileImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = UIView.ContentMode.scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        return image
    }()
    
    var bannerImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = UIView.ContentMode.scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return image
    }()
    
    var ProfileInfoLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    var followingFollowingLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    var locationImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = UIView.ContentMode.scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    var calenderImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = UIView.ContentMode.scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    var joiningDateLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    var locationLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews() {
        contentView.addSubview(bannerImage)
        contentView.addSubview(profileImage)
        contentView.addSubview(ProfileInfoLabel)
        contentView.addSubview(locationImage)
        contentView.addSubview(locationLabel)
        contentView.addSubview(calenderImage)
        contentView.addSubview(joiningDateLabel)
        contentView.addSubview(followingFollowingLabel)
        
        bannerImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bannerImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bannerImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bannerImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25).isActive = true
        profileImage.topAnchor.constraint(equalTo: bannerImage.bottomAnchor, constant: -40).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        profileImage.layer.cornerRadius = 40
        
        ProfileInfoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        ProfileInfoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        ProfileInfoLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor  , constant: 10).isActive = true
        
        locationImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        locationImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        locationImage.leadingAnchor.constraint(equalTo: ProfileInfoLabel.leadingAnchor).isActive = true
        locationImage.topAnchor.constraint(equalTo: ProfileInfoLabel.bottomAnchor, constant: 10).isActive = true
        
        locationLabel.centerYAnchor.constraint(equalTo: locationImage.centerYAnchor).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: locationImage.trailingAnchor, constant: 10).isActive = true
        
        calenderImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        calenderImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        calenderImage.leadingAnchor.constraint(equalTo: ProfileInfoLabel.leadingAnchor).isActive = true
        calenderImage.topAnchor.constraint(equalTo: locationImage.bottomAnchor, constant: 10).isActive = true
        
        joiningDateLabel.centerYAnchor.constraint(equalTo: calenderImage.centerYAnchor).isActive = true
        joiningDateLabel.leadingAnchor.constraint(equalTo: calenderImage.trailingAnchor, constant: 10).isActive = true
        
        followingFollowingLabel.topAnchor.constraint(equalTo: calenderImage.bottomAnchor, constant: 10).isActive = true
        followingFollowingLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        followingFollowingLabel.leadingAnchor.constraint(equalTo: calenderImage.trailingAnchor, constant: 10).isActive = true
    }
}
