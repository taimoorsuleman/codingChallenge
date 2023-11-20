//
//  SeriesBuilder.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 11/11/2023.
//

import Foundation
import UIKit


final class SeriesBuilder{
    
    static func build()-> UIViewController{
        let dashboardVC =  UIStoryboard.instantiate(viewControllerType: SeriesViewController.self, fromStoryboardNamed: StoryboardIdentifiers.main, withIdentifier: .seriesVCIdentifier)
        
        let apiService = SeriesService(networkManager: NetworkManager())
        dashboardVC.viewModel = SeriesViewModel(apiService: apiService)
        return dashboardVC
    }
}
