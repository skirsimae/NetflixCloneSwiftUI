//
//  TopMovieView.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 03/03/2023.
//

import SwiftUI
import Kingfisher

struct TopMovieView: View {
    var movie: Movie
    
    func isCategoryLast(_ category: String) -> Bool {
        let categoryCount = movie.categories.count
        
        if let index = movie.categories.firstIndex(of: category) {
            if index + 1 != categoryCount {
                return false
            }
        }
        return true
    }
    
    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
            
            VStack {
                Spacer()
                HStack {
                    ForEach(movie.categories, id: \.self) { category in
                        HStack {
                            Text(category)
                                .font(.footnote)
                            if !isCategoryLast(category) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                        // TODO fire action
                    }
                    
                    Spacer()
                    
                    PlayButton(text: "Play", imageName: "play.fill") {
                        //
                    }
                    .frame(width: 120)
                    
                    Spacer()
                    
                    SmallVerticalButton(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", isOn: true) {
                        //TODO fire action
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 16)
            }
            .background(LinearGradient.blackOpacityGradient)
            .padding(.top, 250)
        }
        .foregroundColor(.white)
    }
}

struct TopMovieView_Previews: PreviewProvider {
    static var previews: some View {
        TopMovieView(movie: exampleMovie2)
    }
}
