//
//  PlayerViewModel.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 20/11/2023.
//

import Foundation

protocol PlayerDelegate{
    func getPlayerURL()->String
}

final class PlayerViewModel :PlayerDelegate {
    private var url:String
    // MARK: - Init
    init(url: String) {
        self.url = url
    }
    
    func getPlayerURL() -> String {
        return self.url
    }
}
