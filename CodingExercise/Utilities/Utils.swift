//
//  Utils.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 18/11/2023.
//

import Foundation
import UIKit

class Utils{
    
    static func openAlertVC(viewController: UIViewController, alertModel: DropDownViewModel?) {
            let vc = UIStoryboard.instantiate(viewControllerType: DropDownViewController.self, fromStoryboardNamed: StoryboardIdentifiers.main, withIdentifier: .dropdownVCIdentifier)
            vc.modalPresentationStyle = .overFullScreen
            vc.viewModel = alertModel
            viewController.present(vc, animated: false, completion: nil)
    }
}
