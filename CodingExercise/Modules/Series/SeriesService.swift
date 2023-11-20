//
//  SeriesService.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 11/11/2023.
//

import Foundation

//typealias SeiresCompletionClosure = ((Array?, Error?) -> Void)


protocol SeriesWebServiceProtocol {
    func getSeriesInfo(seriesID:String) async throws -> SeriesModel
    func getSeasonInfo(seriesID:String,seasonID:String) async throws -> SeasonModel
}


final class SeriesService : SeriesWebServiceProtocol{
    
    var networkManager: NetworkManager
    
    // MARK: -  Initialization
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    // MARK: - API METHOD

    
    func getSeriesInfo(seriesID:String) async throws -> SeriesModel {
        let urlString = "\(APIConstants.apiBaseURL)\(seriesID)?api_key=\(APIConstants.apiKey)"
        guard let request = networkManager.createRequest(for: urlString) else {
            throw NetworkError.invalidURL
        }
        
        return try await networkManager.executeRequest(request: request)
    }
    
    func getSeasonInfo(seriesID:String,seasonID:String) async throws -> SeasonModel {
        let urlString = "\(APIConstants.apiBaseURL)\(seriesID)/season/\(seasonID)?api_key=\(APIConstants.apiKey)"
        guard let request = networkManager.createRequest(for: urlString) else {
            throw NetworkError.invalidURL
        }
        
        return try await networkManager.executeRequest(request: request)
    }
}
