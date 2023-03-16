//
//  MoreLikeThisView.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 13/03/2023.
//

import SwiftUI

struct MoreLikeThisView: View {
    var movies: [Movie]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(0..<movies.count, id: \.self) { index in
                StandardHomeMovie(movie: movies[index])
            }
        }
    }
}

struct MoreLikeThisView_Previews: PreviewProvider {
    
    static var previews: some View {
        MoreLikeThisView(movies: exampleMovies)
    }
}
