//
//  ImageView.swift
//  
//
//  Created by Давид Тоноян  on 22.01.2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    // Function to load image with url and setup it to imageView, needed KingFisher pod
    
    func setupImage(with imageUrl: String) {
        DispatchQueue.main.async { [weak self] in
            self?.tintColor = .orange
            let url = URL(string: imageUrl)
            let processor = DownsamplingImageProcessor(size: self?.bounds.size ?? .zero)
            self?.kf.indicatorType = .activity
            self?.kf.setImage(
                with: url,
                placeholder: UIImage(systemName: "photo"),
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
        }
    }
}
