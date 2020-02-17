//
//  TweetsTableViewCell.swift
//  TwitterAssignment
//
//  Created by Vaishnav C on 2/17/20.
//  Copyright © 2020 Vaishnav C. All rights reserved.
//

import Foundation
import UIKit

class TweetsTableViewCell: UITableViewCell {
    
    var imageContainerHeightAnchor = NSLayoutConstraint()
    
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
    
    var mainStack: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    
    var userInfoStack: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = UIStackView.Distribution.fillProportionally
        return stackView
    }()
    
    var tweetsStack: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()
    
    var tweetImageStack: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = UIStackView.Distribution.fillProportionally
        return stackView
    }()
    
    var userInfoLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.numberOfLines = 1
        return label
    }()
    
    var tweetsLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    var tempView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var tweetImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = UIView.ContentMode.scaleAspectFill
        image.clipsToBounds = true
        
        return image
    }()
    
    var commentButton:UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    var retweetButton:UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    var likeButton:UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    var bottomStack: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = UIStackView.Distribution.equalCentering
        return stackView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews() {
        
        contentView.addSubview(profileImage)
        contentView.addSubview(mainStack)
        profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        profileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImage.layer.cornerRadius = 25
        
        mainStack.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        mainStack.addArrangedSubview(userInfoStack)
        mainStack.addArrangedSubview(tweetsStack)
        mainStack.addArrangedSubview(tweetImageStack)
        mainStack.addArrangedSubview(bottomStack)
        
        
        userInfoStack.addArrangedSubview(userInfoLabel)
        userInfoLabel.topAnchor.constraint(equalTo: userInfoStack.topAnchor, constant: 15).isActive = true
        tweetsStack.addArrangedSubview(tweetsLabel)
        tweetsLabel.topAnchor.constraint(equalTo: tweetsStack.topAnchor, constant: 15).isActive = true
        tweetImageStack.addArrangedSubview(tweetImage)
        
        
        tweetImage.leadingAnchor.constraint(equalTo: tweetImageStack.leadingAnchor).isActive = true
        tweetImage.topAnchor.constraint(equalTo: tweetsStack.bottomAnchor, constant: 15).isActive = true
        tweetImage.bottomAnchor.constraint(equalTo: bottomStack.topAnchor, constant: -15).isActive = true
        imageContainerHeightAnchor = tweetImage.heightAnchor.constraint(equalToConstant: 160)
        imageContainerHeightAnchor.isActive = true
        tweetImage.widthAnchor.constraint(equalToConstant: contentView.frame.width - 70).isActive = true
        tweetImage.layer.cornerRadius = 5
        addBottomStack()
    }
    
    func addBottomStack() {
        
        bottomStack.addArrangedSubview(commentButton)
        commentButton.setImage(UIImage(named: "Comment"), for: .normal)
        commentButton.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: .normal)
        bottomStack.addArrangedSubview(retweetButton)
        retweetButton.setImage(UIImage(named: "Retweet"), for: .normal)
        commentButton.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: .normal)
        bottomStack.addArrangedSubview(likeButton)
        likeButton.setImage(UIImage(named: "Like"), for: .normal)
        commentButton.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: .normal)
    }
}
