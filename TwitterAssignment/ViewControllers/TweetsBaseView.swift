//
//  TweetsBaseView.swift
//  TwitterAssignment
//
//  Created by Vaishnav C on 2/17/20.
//  Copyright © 2020 Vaishnav C. All rights reserved.
//

import Foundation
import  UIKit


class TweetsBaseView: UIViewController {
    
    var refreshControl = UIRefreshControl()
    let searchController = UISearchController(searchResultsController: nil)
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    
    func setupViews() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setUpNavBar()
        setUpSearchBar()
        pullToRefresh()
        
        view.addSubview(mainTable)
        
        mainTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    var mainTable: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = .singleLine
        return view
    }()
    
    func setUpNavBar()  {
        navigationItem.title = "TWITTER"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init(red: 29/255, green: 161/255, blue: 242/255, alpha: 1),
                              NSAttributedString.Key.font:UIFont.systemFont(ofSize: 24, weight: .heavy)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let attr =  [NSAttributedString.Key.foregroundColor:UIColor.init(red: 29/255, green: 161/255, blue: 242/255, alpha: 1),
                     NSAttributedString.Key.font:UIFont.systemFont(ofSize: 32, weight: .heavy)]
        navigationController?.navigationBar.largeTitleTextAttributes = attr
    }
    
    func setUpSearchBar() {
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchBar.barStyle = .default
        searchController.searchBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchController.searchBar.isTranslucent = false
        searchController.searchBar.searchBarStyle = .minimal
        self.navigationItem.searchController = searchController
    }
    
    func pullToRefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshControl.addTarget(self, action: #selector(TweetsViewController.refresh), for: UIControl.Event.valueChanged)
        mainTable.addSubview(refreshControl)
        
    }
}
