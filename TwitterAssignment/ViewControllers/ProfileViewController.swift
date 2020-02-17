//
//  ProfileViewController.swift
//  TwitterAssignment
//
//  Created by Vaishnav C on 2/17/20.
//  Copyright © 2020 Vaishnav C. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher


class ProfileViewController: ProfileBaseView {
    
    var viewModel: ProfileViewModel!
    var coverImage = UIImage()
    
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        mainTable.dataSource = self
        mainTable.delegate = self
        self.viewModel.tableCellTypes.forEach({ $0.registerCell(tableView: self.mainTable)})
        setupViews()
        defineClosures()
        viewModel.reloadTable?()
        viewModel.getUserTweets()
        getImage()
    }
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setUpNavBar()
    }
    
    @objc func refresh() {
        viewModel.getUserTweets()
        refreshControl.endRefreshing()
    }
}


extension ProfileViewController {
    
    func defineClosures() {
        viewModel.reloadTable = { [weak self] in
            guard let strongSelf = self else {return}
            strongSelf.viewModel.assignTableViewCells()
            strongSelf.mainTable.reloadData()
        }
        
        viewModel.showAlert = {  [weak self] (title,message) in
            guard let strongSelf = self else {return}
            Helper.showAlert(title: title, message: message, presenter: strongSelf)
        }
    }
    
    func getImage() {
        guard let bannerURL = viewModel.userInfo.profileBannerUrl else {return}
        if let url = URL(string: bannerURL) {
            DispatchQueue.main.async {
                do{
                    let data = try Data(contentsOf: url)
                    self.coverImage = UIImage(data: data) ?? UIImage()
                } catch(let error) {
                    print(error)
                }
            }
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var offset = scrollView.contentOffset.y/200
        if offset > 1 {
            offset = 1
            self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
            setUpNavBarImage()
        } else {
            self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
        }
    }
    
    func setUpNavBarImage() {
        
        self.navigationController?.navigationBar.setBackgroundImage(coverImage, for: .default)
        self.navigationController?.navigationBar.isOpaque = true
        UIApplication.shared.statusBarView?.isOpaque = true
        
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = self.viewModel.tableCells[indexPath.row]
        return cellViewModel.cellInstantiate(tableView: tableView,indexPath: indexPath)
    }
}
