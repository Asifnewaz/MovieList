//
//  UIViewController+Extension.swift
//  movieList
//
//  Created by USER on 5/30/22.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
extension UIViewController {
    
    @available(iOS 13.0, *)
    static func instantiate<T>(storyBoard: String) -> T {
        let storyboard = UIStoryboard(name: storyBoard, bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "\(T.self)") as! T
        return controller
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        
        if let nav = self.navigationController {
            nav.view.endEditing(true)
        }
    }
}

enum StoryBoard: String {
    
    case main = "Main"
    
    var name:String {
        return self.rawValue
    }
}
