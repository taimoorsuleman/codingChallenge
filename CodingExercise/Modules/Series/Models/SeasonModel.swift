//
//  EpisodesModel.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 12/11/2023.
//

import Foundation

// MARK: - EpisodesModel
struct SeasonModel: Codable {
    var id, airDate: String?
    var episodes: [Episode]?
    var name, overview: String?
    var episodesModelID: Int?
    var posterPath: String?
    var seasonNumber: Int?
    var voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case airDate = "air_date"
        case episodes, name, overview
        case episodesModelID = "id"
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
        case voteAverage = "vote_average"
    }
}

// MARK: - Episode
struct Episode: Codable {
    var episodeNumber, id: Int?
    var name, overview: String?
    var runtime, seasonNumber, showID: Int?
    var stillPath: String?
    
    enum CodingKeys: String, CodingKey {
        case episodeNumber = "episode_number"
        case id, name, overview, runtime
        case seasonNumber = "season_number"
        case showID = "show_id"
        case stillPath = "still_path"
    }
}


extension SeasonModel{
    static let mock : SeasonModel = .init(id: "",episodes: Episode.mockedArray, name: "",posterPath: "",seasonNumber: 0,voteAverage: 0)
    
}

extension Episode{
    static let mock : Episode = .init(id: 0,name: "",seasonNumber: 0,stillPath: "")
    
    
    static let mockedArray : [Episode] = [
        .init(id: 0,name: "",seasonNumber: 0,stillPath: ""),
        .init(id: 0,name: "",seasonNumber: 0,stillPath: ""),
        .init(id: 0,name: "",seasonNumber: 0,stillPath: "")
    ]

    
}
