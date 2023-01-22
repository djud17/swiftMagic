//
//  CustomSearchBar.swift
//  
//
//  Created by Давид Тоноян  on 22.01.2023.
//

import UIKit

// MARK: - Extension for custom searchBar
// https://medium.com/@mandoramuku07/customize-uisearchbar-for-different-ios-versions-6ee02f4d4419

extension UISearchBar {
    
    // Property for accessing textfield and changing it’s properties
    public var textField: UITextField? {
        if #available(iOS 13, *) {
            return searchTextField
        }
        let subViews = subviews.flatMap { $0.subviews }
        
        return (subViews.filter { $0 is UITextField }).first as? UITextField
    }
    
    // Function to clear search bar background color
    func clearBackgroundColor() {
        guard let UISearchBarBackground = NSClassFromString("UISearchBarBackground") else { return }
        
        for view in subviews {
            for subview in view.subviews where subview.isKind(of: UISearchBarBackground) {
                subview.alpha = 0
            }
        }
    }
    
    // Properties for adding loader in UISearchBar
    private var activityIndicator: UIActivityIndicatorView? {
        textField?.leftView?.subviews.compactMap { $0 as? UIActivityIndicatorView }.first
    }
    
    var isLoading: Bool {
        get {
            return activityIndicator != nil
        } set {
            if newValue {
                if activityIndicator == nil {
                    let newActivityIndicator = UIActivityIndicatorView(style: .medium)
                    newActivityIndicator.color = .gray
                    newActivityIndicator.startAnimating()
                    newActivityIndicator.backgroundColor = textField?.backgroundColor ?? .white
                    
                    textField?.leftView?.addSubview(newActivityIndicator)
                    let leftViewSize = textField?.leftView?.frame.size ?? .zero
                    
                    let xOrigin = leftViewSize.width - newActivityIndicator.frame.width / 2
                    let yOrigin = leftViewSize.height / 2
                    let activityCenter = CGPoint(x: xOrigin, y: yOrigin)
                    newActivityIndicator.center = activityCenter
                }
            } else {
                activityIndicator?.removeFromSuperview()
            }
        }
    }
    
    // Function for changing UISearchBar placeholder color
    func changePlaceholderColor(_ color: UIColor) {
        guard let UISearchBarTextFieldLabel = NSClassFromString("UISearchBarTextFieldLabel"),
              let field = textField else {
            return
        }
        for subview in field.subviews where subview.isKind(of: UISearchBarTextFieldLabel) {
            guard let label = subview as? UILabel else { return }
            
            label.textColor = color
        }
    }
    
    // Function for adding right icon in UISearchBar
    func setRightImage(normalImage: UIImage, highLightedImage: UIImage) {
        showsBookmarkButton = true
        if let btn = textField?.rightView as? UIButton {
            btn.setImage(normalImage, for: .normal)
            btn.setImage(highLightedImage, for: .highlighted)
        }
    }
    
    // Function for adding padding and changing left icon
    func setLeftImage(_ image: UIImage, with padding: CGFloat = 0, tintColor: UIColor) {
        let imageView = UIImageView()
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.tintColor = tintColor
        
        if padding != 0 {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.distribution = .fill
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            let paddingView = UIView()
            paddingView.translatesAutoresizingMaskIntoConstraints = false
            paddingView.widthAnchor.constraint(equalToConstant: padding).isActive = true
            paddingView.heightAnchor.constraint(equalToConstant: padding).isActive = true
            stackView.addArrangedSubview(paddingView)
            stackView.addArrangedSubview(imageView)
            textField?.leftView = stackView
        } else {
            textField?.leftView = imageView
        }
    }
}
