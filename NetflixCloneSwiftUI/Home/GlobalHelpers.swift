//
//  GlobalHelpers.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 03/03/2023.
//

import Foundation

let exampleMovie1 = Movie(id: UUID().uuidString, name: "DARK", thumbnailURL: URL(string: "https:/picsum.photos/200/300")!, categories: ["Dystopian", "Exciting", "Suspensful", "Sci-Fi TV"])
let exampleMovie2 = Movie(id: UUID().uuidString, name: "Travellers", thumbnailURL: URL(string: "https:/picsum.photos/200/300/")!, categories: ["Dystopian", "Exciting", "Suspensful", "Sci-Fi TV"])
let exampleMovie3 = Movie(id: UUID().uuidString, name: "Community", thumbnailURL: URL(string: "https:/picsum.photos/200/301")!, categories: ["Dystopian", "Exciting", "Suspensful", "Sci-Fi TV"])
let exampleMovie4 = Movie(id: UUID().uuidString, name: "Alone", thumbnailURL: URL(string: "https:/picsum.photos/200/302")!, categories: ["Dystopian", "Exciting", "Suspensful", "Sci-Fi TV"])
let exampleMovie5 = Movie(id: UUID().uuidString, name: "Hannibal", thumbnailURL: URL(string: "https:/picsum.photos/200/303")!, categories: ["Dystopian", "Exciting", "Suspensful", "Sci-Fi TV"])
let exampleMovie6 = Movie(id: UUID().uuidString, name: "After Life", thumbnailURL: URL(string: "https:/picsum.photos/200/304")!, categories: ["Dystopian", "Exciting", "Suspensful", "Sci-Fi TV"])


let exampleMovies: [Movie] = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]
