//
//  Constants.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 11/11/2023.
//

import Foundation


struct Constants {
    static let kImageDimensionRatio = CGFloat(16.0/9.0)
    static let moviesCellHeight = CGFloat(300)
    static let moviesCellWidth = CGFloat(moviesCellHeight * kImageDimensionRatio)
//    static let profileID : String = .imageProfileID
}


struct APIConstants {
    static let apiBaseURL : String = .apiBaseURL
    static let apiKey : String = .apiKey
}

struct StoryboardIdentifiers{
    static let main : String = .mainStoryboardIdentifier
}

struct ViewControllerIdentifiers{
    static let seriesVCIdentifier : String = .seriesVCIdentifier
    static let dropDownVCIdentifier : String = .dropdownVCIdentifier
    static let playerVCIdentifier : String = .playerVCIdentifier

}


struct CellIdentifiers{
    static let episodeTableViewCell :String = .episodeTableViewCell
    static let seriesHeaderTableViewCell :String = .seriesHeaderTableViewCell
    static let dropDownTableViewCell :String = .dropDownTableViewCell

}



extension String{
    //End Points
    static let apiBaseURL = "https://api.themoviedb.org/3/tv/"
    static let apiKey = "3d0cda4466f269e793e9283f6ce0b75e"
    //StoryBoards
    static let mainStoryboardIdentifier = "Main"
    
    //Strings
    static let emptyString = ""
    
    //Identifiers
    static let seriesVCIdentifier = "SeriesViewController"
    static let dropdownVCIdentifier = "DropDownViewController"
    static let playerVCIdentifier = "PlayerViewController"

    static let seasonNameCollectionViewCell = "SeasonNameCollectionViewCell"
    static let episodeTableViewCell = "EpisodeTableViewCell"
    static let seriesHeaderTableViewCell = "SeriesHeaderTableViewCell"
    static let dropDownTableViewCell = "DropDownTableViewCell"

    
}
