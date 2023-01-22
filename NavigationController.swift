//
//  NavigationController.swift
//  
//
//  Created by Давид Тоноян  on 22.01.2023.
//

import UIKit

extension UINavigationController {
    
    // Function to configurate navigation controller style
    
    func setupControllerStyle() {
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: .white
        ]
        self.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: .orange
        ]
        self.navigationBar.tintColor = .white
    }
}
