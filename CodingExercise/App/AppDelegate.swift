//
//  AppDelegate.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 11/11/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupInitialViewController()
        return true
    }


    

    ///  Setup Initial Screen
    private func setupInitialViewController() {
        let seriesVC = SeriesBuilder.build()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = seriesVC
        self.window?.makeKeyAndVisible()
    }
}

