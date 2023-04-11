//
//  PreviewViewModel.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 04/04/2023.
//

import Foundation

class PreviewViewModel: ObservableObject {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
