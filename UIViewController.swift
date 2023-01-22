//
//  UIViewController.swift
//  
//
//  Created by Давид Тоноян  on 22.01.2023.
//

import UIKit

extension UIViewController {
    
    // Functions to hide keyboard when user tap outside keyboard
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardView))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboardView() {
        view.endEditing(true)
    }
}
