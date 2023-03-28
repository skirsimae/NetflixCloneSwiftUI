//
//  SearchResultsGrid.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 28/03/2023.
//

import SwiftUI

struct SearchResultsGrid: View {
    var movies: [Movie]
    
    @Binding var movieDetailToShow: Movie?
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(movies, id: \.id) { movie in
            StandardHomeMovie(movie: movie)
                .frame(height: 160)
                .onTapGesture(perform: {
                    movieDetailToShow = movie
                })
            }
        }
    }
}

struct SearchResultsGrid_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsGrid(movies: generateMovies(20), movieDetailToShow: .constant(nil))
    }
}
