//
//  Router.swift
//  TwitterAssignment
//
//  Created by Vaishnav C on 2/17/20.
//  Copyright © 2020 Vaishnav C. All rights reserved.
//

import Foundation
import UIKit

final class Router {
    
    //MARK: Private
    var navigationController: UINavigationController
    let applicationInstance: Application
    var window: UIWindow
    
    
    init(window: UIWindow, application: Application) {
        
        navigationController = UINavigationController()
        self.applicationInstance = application
        self.window = window
        self.navigationController.setNavigationBarHidden(true, animated: true)
        
        window.makeKeyAndVisible()
        window.rootViewController = self.navigationController
        self.moveToMainScreen()
    }
    
    func moveToMainScreen() {
        
        let viewModel = TweetsViewModel()
        window.rootViewController = UINavigationController(rootViewController: TweetsViewController(viewModel: viewModel))
    }
}
