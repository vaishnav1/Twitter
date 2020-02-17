//
//  CellProtocol.swift
//  TwitterAssignment
//
//  Created by Vaishnav C on 2/17/20.
//  Copyright © 2020 Vaishnav C. All rights reserved.
//

import Foundation
import UIKit

protocol CellProtocol {
    
    static func registerCell(tableView : UITableView)
    
    func cellInstantiate(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell
    
    func didSelect(tableView: UITableView, indexPath: IndexPath)
}

extension CellProtocol {
    func didSelect(tableView: UITableView, indexPath: IndexPath) {
    }
}

