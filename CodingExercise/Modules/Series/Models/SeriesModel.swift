//
//  SeriesModel.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 11/11/2023.
//

import Foundation

struct SeriesModel: Codable {
    var adult: Bool?
    var backdropPath: String?
    var episodeRunTime: [Int]?
    var homepage: String?
    var id: Int?
    var lastAirDate, name: String?
    var numberOfEpisodes, numberOfSeasons: Int?
    var originalLanguage, originalName, overview: String?
    var popularity: Double?
    var posterPath: String?
    var seasons: [Season]?
    var tagline: String?
    var voteAverage: Double?
    var voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case episodeRunTime = "episode_run_time"
        case homepage, id
        case lastAirDate = "last_air_date"
        case name
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case seasons, tagline
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - Season
struct Season: Codable {
    var episodeCount, id: Int?
    var name, posterPath: String?
    var seasonNumber: Int?

    enum CodingKeys: String, CodingKey {
        case episodeCount = "episode_count"
        case id, name
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
    }
}


extension SeriesModel{
    static let mock : SeriesModel = .init(id: 0,lastAirDate: "",name: "Billions",numberOfSeasons: 3,overview: "",posterPath: "",seasons: Season.mockedArray)
}


extension Season{
    static let mock :Season = .init(episodeCount: 0,id: 0,name: "",posterPath: "",seasonNumber: 0)
    
    static let mockedArray:[Season] = [
        .init(episodeCount: 0,id: 0,name: "",posterPath: "",seasonNumber: 0),
        .init(episodeCount: 0,id: 0,name: "",posterPath: "",seasonNumber: 0),
        .init(episodeCount: 0,id: 0,name: "",posterPath: "",seasonNumber: 0),
        .init(episodeCount: 0,id: 0,name: "",posterPath: "",seasonNumber: 0)
    ]
}
