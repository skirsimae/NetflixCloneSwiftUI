//
//  HomeViewModel.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 03/03/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    // String == Category
    @Published var movies: [String: [Movie]] = [:]
    
    public var allCategories: [String] {
        movies.keys.map({ String($0) })
    }
    
    public func getMovie(forCategory category: String, forHomeTopRow homeTopRow: HomeTopRow) -> [Movie] {
        
        switch homeTopRow {
        case .home:
            return movies[category] ?? []
        case .movies:
            return (movies[category] ?? []).filter({ $0.movieType == .movie })
        case .tvShows:
            return (movies[category] ?? []).filter({ $0.movieType == .tvShow })
        case .myList:
            return movies[category] ?? []
            //TODO: setup My List 
        }
    }
    
    init() {
        setupMovies()
    }
    
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up"] = exampleMovies.shuffled()
        movies["New Releases"] = exampleMovies.shuffled()
        movies["Watch It Again"] = exampleMovies.shuffled()
        movies["Sci-Fi Movies"] = exampleMovies.shuffled()
    }
}
