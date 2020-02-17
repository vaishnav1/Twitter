//
//  Helper.swift
//  TwitterAssignment
//
//  Created by Vaishnav C on 2/17/20.
//  Copyright © 2020 Vaishnav C. All rights reserved.
//

import Foundation
import UIKit

final class Helper {
    
    static func convertToURLEncoding(string:String) -> String {
        let allowedQueryParamAndKey =  NSCharacterSet(charactersIn: ";/?:@&=+$, ").inverted
        return string.addingPercentEncoding(withAllowedCharacters: allowedQueryParamAndKey) ?? ""
    }
    
    static func isStatusOK(status: Int) -> Bool {
        if status == 200 {return true}
        return false
    }
    
    static func showAlert(title: String, message: String, presenter: UIViewController) {
        let alert = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        presenter.present(alert, animated: true, completion: nil)
    }
    
    static func instantiateVC(_ storyboard: String = "", viewControllerName: String = "") -> UIViewController {
        
        let viewController = UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: viewControllerName)
        
        return viewController
    }
    
}
