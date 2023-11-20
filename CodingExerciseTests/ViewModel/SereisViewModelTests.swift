//
//  SereisViewModelTests.swift
//  CodingExerciseTests
//
//  Created by Taimoor Suleman on 19/11/2023.
//

import XCTest
@testable import CodingExercise

final class SereisViewModelTests: XCTestCase {

    // execute before test
    var sut : SeriesViewModel!
    var mockService : MockAPIService!
    
    override func setUp() {
        mockService = MockAPIService()
        sut = .init(apiService: mockService)
    }
    
    //after test //deinit
    override func tearDown() {
        mockService = nil
        sut = nil
    }
    
    
    func test_seriesApiCall_failure_responseShouldBeNil() async{
        //given
        var seriesData: SeriesModel?
        
        //when
        mockService.isError = true
        seriesData = try? await mockService.getSeriesInfo(seriesID: "62852")
        
        //then
        XCTAssertNil(seriesData)
    }
    
    
    func test_seriesApiCall_sucess_responseShouldNotBeNil() async{
        //given
        var seriesData: SeriesModel?
        
        //when

        seriesData = try? await mockService.getSeriesInfo(seriesID: "62852")
        
        //then
        XCTAssertNotNil(seriesData)
    }
    
    
    func test_seasonApiCall_failure_responseShouldBeNil() async{
        //given
        var seasonData: SeasonModel?
        
        //when
        mockService.isError = true
        seasonData = try? await mockService.getSeasonInfo(seriesID: "62852", seasonID: "0")
        //then
        XCTAssertNil(seasonData)
    }
    
    func test_seasonApiCall_sucess_responseShouldNotBeNil() async{
        //given
        var seasonData: SeasonModel?
        
        //when
        seasonData = try? await mockService.getSeasonInfo(seriesID: "62852", seasonID: "0")
        //then
        XCTAssertNotNil(seasonData)
    }
    
    
    
}
