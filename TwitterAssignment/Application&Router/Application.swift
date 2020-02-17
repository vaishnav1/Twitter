//
//  Application.swift
//  TwitterAssignment
//
//  Created by Vaishnav C on 2/17/20.
//  Copyright © 2020 Vaishnav C. All rights reserved.
//

import Foundation
import UIKit

class Application {
    
    //MARK: Variables
    private let window: UIWindow
    lazy var navigation: Router  = Router(window: self.window, application: self)
    
    //MARK: Initialization
    init(window: UIWindow) {
        self.window = window
    }
    
}
