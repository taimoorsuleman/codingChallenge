//
//  UIViewController + Ext.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 11/11/2023.
//

import UIKit

extension UIViewController {
    
    //MARK: - Activity Indicator Methods
    
    func startActivityIndicator(style: UIActivityIndicatorView.Style = .large, color: UIColor? = .white) {
        let activityIndicator = UIActivityIndicatorView(style: style)
        activityIndicator.center = view.center
        activityIndicator.color = color ?? view.tintColor
       
        // Add a unique tag to identify the activity indicator
        activityIndicator.tag = 100
        
        activityIndicator.hidesWhenStopped = true
        DispatchQueue.main.async {
            self.view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
        }
    }
    
    func stopActivityIndicator() {
        DispatchQueue.main.async {
            if let activityIndicator = self.view.viewWithTag(100) as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
    }
    
    
}







