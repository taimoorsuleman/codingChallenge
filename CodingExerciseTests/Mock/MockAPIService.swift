//
//  MockAPIService.swift
//  CodingExerciseTests
//
//  Created by Taimoor Suleman on 19/11/2023.
//

import Foundation
@testable import CodingExercise



final class MockAPIService:SeriesWebServiceProtocol{
    
    
    var isError: Bool = false
    
    func getSeriesInfo(seriesID:String) async throws -> SeriesModel{
        if isError{
            throw NetworkError.unableToComplete
        }else{
            return SeriesModel.mock
        }
    }
    
    func getSeasonInfo(seriesID:String,seasonID:String) async throws -> SeasonModel{
        if isError{
            throw NetworkError.unableToComplete
        }else{
            return SeasonModel.mock
        }
    }
    
}
