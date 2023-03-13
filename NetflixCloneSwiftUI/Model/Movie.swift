//
//  Movie.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 03/03/2023.
//

import Foundation

struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    
    var categories: [String]
    
    //MovieDetail View
    var year: Int
    var rating: String
    var numberOfSeasons: Int?
    
    //Personalisation
    var currentEpisode: CurrentEpisodeInfo?
    
    var defaultEpisodeInfo: CurrentEpisodeInfo
    var creators: String
    var cast: String
    
    var moreLikeThisMovies: [Movie]
    
    var episodes: [Episode]?
    
    var promotionHeadline: String?
    
    var numberOfSeasonsDisplay: String {
        if let numberOfSeasons = numberOfSeasons {
            if numberOfSeasons == 1 {
                return "1 season"
            } else {
                return "\(numberOfSeasons) seasons"
            }
        }
        
        return ""
    }
    
    //Current Episode Information
    // 1. Default - if not yet started watching it
    // 2. Personalised - if already started
    
    var episodeInfoDisplay: String {
        if let currentEpisode = currentEpisode {
            return "S\(currentEpisode.season):E\(currentEpisode.episode) \(currentEpisode.episodeName)"
        } else {
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.episodeName)"
        }
    }
    
    var episodeDescriptionDisplay: String {
        if let currentEpisode = currentEpisode {
            return currentEpisode.description
        } else {
            return defaultEpisodeInfo.description
        }
    }
}

struct CurrentEpisodeInfo: Hashable, Equatable {
    var episodeName: String
    var description: String
    var season: Int
    var episode: Int
}
