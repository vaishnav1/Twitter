//
//  ProfileBaseView.swift
//  TwitterAssignment
//
//  Created by Vaishnav C on 2/17/20.
//  Copyright © 2020 Vaishnav C. All rights reserved.
//

import Foundation
import UIKit

class ProfileBaseView: UIViewController {
    
    var refreshControl = UIRefreshControl()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    
    func setupViews() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        pullToRefresh()
        
        view.addSubview(mainTable)
        
        mainTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainTable.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.mainTable.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
    }
    
    var mainTable: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = .singleLine
        return view
    }()
    
    func setUpNavBar()  {
        if let navController = navigationController {
            clearNavigationBar(forBar: navController.navigationBar)
            navController.view.backgroundColor = .clear
        }
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func clearNavigationBar(forBar navBar: UINavigationBar) {
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
    }
    
    func pullToRefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshControl.addTarget(self, action: #selector(ProfileViewController.refresh), for: UIControl.Event.valueChanged)
        mainTable.addSubview(refreshControl)
    }
    
}
