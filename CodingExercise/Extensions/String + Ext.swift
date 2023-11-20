//
//  String.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 11/11/2023.
//

import Foundation

extension String {
    
    /// Converts String to URL?
    var toUrl: URL? {
        return URL(string: self)
    }
    
    
    /// Create Image URL, iit will append profle to the image URL and as well as the channelID
    /// - Parameter channelID: ChannelID
    /// - Returns: Image URL?
    func generateImageURLWithPath()->URL?{
        let imgUrl = "https://image.tmdb.org/t/p/original/\(self)"
        return imgUrl.toUrl
    }
}
