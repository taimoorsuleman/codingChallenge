//
//  SeriesViewModel.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 11/11/2023.
//

import Foundation
protocol SeriesViewModelPresentable {
    
    func numberOfSeasons()-> Int
    func fetchSeriesData(seriesID:String)
    func fetchSeasonData(seasonID:String)
    func getEpisodeModel(for index: Int) -> Episode
    func getSeriesModel() -> SeriesModel
    func getDropDownData()-> [DropDownModel]?
    func getSelectedDropDown()-> DropDownModel?

    var reloadTableViewData: (()->())? { get set }
    var stopActivityIndicator: (()->())? { get set }
    var selectedSeasonIndex : Int? { get set }
}


final class SeriesViewModel: SeriesViewModelPresentable {
    
    // MARK: - Properties
    private var apiService: SeriesWebServiceProtocol
    private var seriesDetail: SeriesModel?
    private var seasonDetail: SeasonModel?

    
    // MARK: - ViewModel Properties And closures
    var reloadTableViewData: (() -> ())?
    var stopActivityIndicator: (()->())?
    var selectedSeasonIndex: Int?

    // MARK: - Init
    init(apiService: SeriesWebServiceProtocol) {
        self.apiService = apiService
    }
    
   
    // MARK: - View Model Methods
    
    func numberOfSeasons() -> Int {
        return seriesDetail?.seasons?.count ?? 0
    }
    
    func getEpisodeModel(for index: Int) -> Episode {
        return self.seasonDetail?.episodes?[index] ?? Episode()
    }
    
    
    func getSeriesModel()-> SeriesModel{
        return self.seriesDetail ?? SeriesModel()
    }
    
    func getDropDownData() -> [DropDownModel]? {
        return self.seriesDetail?.seasons?.map({DropDownModel(title: $0.name ?? .emptyString, id: "\($0.seasonNumber ?? 0)")})
        
    }
    
    func getSelectedDropDown() -> DropDownModel? {
        let selectedSeason = self.seriesDetail?.seasons?[selectedSeasonIndex ?? 0]
        return selectedSeason.map({DropDownModel(title: $0.name ?? .emptyString, id: "\($0.seasonNumber ?? 0)")})
    }
    
    func fetchSeriesData(seriesID:String) {
         Task{
             do{
                 self.seriesDetail = try await apiService.getSeriesInfo(seriesID: seriesID)
                 fetchSeasonData(seasonID: "\(seriesDetail?.seasons?.first?.seasonNumber ?? 0)")
             }catch{
                self.stopActivityIndicator?()
                 debugPrint(error)
             }
         }
    }
    
    func fetchSeasonData(seasonID:String) {
         Task{
             do{
                 let seriesID = "\(seriesDetail?.id ?? 0)"
                 self.seasonDetail = try await apiService.getSeasonInfo(seriesID: seriesID, seasonID: seasonID)
                 self.reloadTableViewData?()

             }catch{
                self.stopActivityIndicator?()
                 print(error)
             }
         }
    }
    
}
