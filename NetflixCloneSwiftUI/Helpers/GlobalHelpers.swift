//
//  GlobalHelpers.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 03/03/2023.
//

import Foundation
import SwiftUI

let exampleMovie1 = Movie(id: UUID().uuidString, name: "DARK", thumbnailURL: URL(string: "https:/picsum.photos/200/300")!, categories: ["Dystopian", "Exciting", "Suspensful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeasons: 1)
let exampleMovie2 = Movie(id: UUID().uuidString, name: "Travellers", thumbnailURL: URL(string: "https:/picsum.photos/200/300/")!, categories: ["Dystopian", "Exciting", "Suspensful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeasons: 2)
let exampleMovie3 = Movie(id: UUID().uuidString, name: "Community", thumbnailURL: URL(string: "https:/picsum.photos/200/301")!, categories: ["Dystopian", "Exciting", "Suspensful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeasons: 3)
let exampleMovie4 = Movie(id: UUID().uuidString, name: "Alone", thumbnailURL: URL(string: "https:/picsum.photos/200/302")!, categories: ["Dystopian", "Exciting", "Suspensful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeasons: 4)
let exampleMovie5 = Movie(id: UUID().uuidString, name: "Hannibal", thumbnailURL: URL(string: "https:/picsum.photos/200/303")!, categories: ["Dystopian", "Exciting", "Suspensful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeasons: 5, promotionHeadline: "New episodes coming soon")
let exampleMovie6 = Movie(id: UUID().uuidString, name: "After Life", thumbnailURL: URL(string: "https:/picsum.photos/200/304")!, categories: ["Dystopian", "Exciting", "Suspensful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeasons: 6, promotionHeadline: "Watch Season 6 Now")


let exampleMovies: [Movie] = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]


extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(
        gradient: Gradient(colors: [.black.opacity(0.0), .black.opacity(1)]),
        startPoint: .top,
        endPoint: .bottom
    )
}
