//
//  UIImageView.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 11/11/2023.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    
    /// Download image from url and set to imageview
    /// - Parameter url: URL?
    func setImage(withURL url: URL?) {
        
        if let url = url {
            self.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder-image"), options: [], context: nil)
        }
    }
}
