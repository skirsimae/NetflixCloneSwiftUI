//
//  HomeStackView.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 16/03/2023.
//

import SwiftUI

struct HomeStackView: View {
    var viewModel: HomeViewModel
    
    var topRowSelection: HomeTopRow
    var genre: HomeGenre
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        ForEach(viewModel.allCategories, id: \.self) { category in
            VStack {
                HStack {
                    Text(category)
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.getMovie(forCategory: category, forHomeTopRow: topRowSelection, forGenre: genre)) { movie in
                            StandardHomeMovie(movie: movie)
                                .frame(width: 100, height: 200)
                                .padding(.horizontal, 20)
                                .onTapGesture {
                                    movieDetailToShow = movie
                                }
                            
                        }
                    }
                }
            }
        }
    }
}

struct HomeStackView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                HomeStackView(viewModel: HomeViewModel(), topRowSelection: .home, genre: .AllGenres, movieDetailToShow: .constant(nil))
            }
            .foregroundColor(.white)
        }
    }
}
