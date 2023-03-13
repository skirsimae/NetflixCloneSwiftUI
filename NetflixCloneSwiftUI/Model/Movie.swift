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
    
}
