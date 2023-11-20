//
//  PlayerBuilder.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 20/11/2023.
//

import Foundation
import UIKit

final class PlayerBuilder{
    
    static func build(videoURL:String)-> UIViewController{
        let playerVC =  UIStoryboard.instantiate(viewControllerType: PlayerViewController.self, fromStoryboardNamed: StoryboardIdentifiers.main, withIdentifier: .playerVCIdentifier)
        
        playerVC.viewModel = PlayerViewModel(url: videoURL)
        return playerVC
    }
}

