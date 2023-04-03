//
//  ComingSoonViewModel.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 03/04/2023.
//

import Foundation


class ComingSooViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        self.movies = generateMovies(20)
    }
}
