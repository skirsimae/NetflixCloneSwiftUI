//
//  PopularMovieView.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 27/03/2023.
//

import SwiftUI
import Kingfisher

struct PopularMovieView: View {
    var movie: Movie
    var body: some View {
        GeometryReader { proxy in
            HStack {
                KFImage(movie.thumbnailURL)
                    .resizable()
                    .frame(width: proxy.size.width / 3)
                    .padding(.leading, 3)
                    
                Text(movie.name)
                
                Spacer()
                
                Button {
                    //play movie
                } label: {
                    Image(systemName: "arrowtriangle.right.fill")
                }
                .padding(.trailing, 20)
            }
            .foregroundColor(.white)
        }
    }
}

struct PopularMovieView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            PopularMovieView(movie: exampleMovie1)
                .frame(height: 75)
                .padding(.horizontal, 50)
        }
    }
}
