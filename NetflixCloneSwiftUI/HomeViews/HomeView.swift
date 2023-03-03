//
//  HomeView.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 03/03/2023.
//

import SwiftUI

struct HomeView: View {
    var viewModel = HomeViewModel()
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            

            //Main VStack
            //Lazy VStack will request the images on scroll
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    
                    TopRowButtons()
                         
                    TopMovieView(movie: exampleMovie1)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                    //put the top view behind the top header
                        .zIndex(-1)
                    
                    //identify each category with the id: \.self == each category is unique with the hash value
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
                                    ForEach(viewModel.getMovie(for: category)) { movie in
                                        StandardHomeMovie(movie: movie)
                                            .frame(width: 100, height: 200)
                                            .padding(.horizontal, 20)
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews:
    PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopRowButtons: View {
    var body: some View {
        HStack {
            Button {
                //
            } label: {
                Image("netflix_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
            }
            
            Spacer()
            
            Button {
                //
            } label: {
                Text("TV Shows")
            }
            
            Button {
                //
            } label: {
                Text("TV Shows")
            }
            
            
            Spacer()
            
            Button {
                //
            } label: {
                Text("Movies")
            }
            
            
            Spacer()
            
            Button {
                //
            } label: {
                Text("My List")
            }
            
        }
        .padding(.leading, 10)
        .padding(.trailing, 30)
    }
}
