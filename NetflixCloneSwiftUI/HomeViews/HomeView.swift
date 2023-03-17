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
    
    @State private var movieDetailToShow: Movie? = nil
    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .AllGenres
    @State private var showGenreSelection = false
    @State private var showTopRowSelection = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            //Main VStack
            //Lazy VStack will request the images on scroll
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    
                    TopRowButtons(topRowSelection: $topRowSelection, homeGenre: $homeGenre, showGenreSelection: $showGenreSelection, showTopRowSelection: $showTopRowSelection)
                    
                    TopMovieView(movie: exampleMovie1)
                        .frame(width: screen.width)
                        .padding(.top, -125)
                    //put the top view behind the top header
                        .zIndex(-1)
                    
                    //identify each category with the id: \.self == each category is unique with the hash value
                    HomeStackView(viewModel: viewModel, topRowSelection: topRowSelection, genre: homeGenre, movieDetailToShow: $movieDetailToShow)
                }
            }
            
            if let movieDetailToShow = movieDetailToShow {
                MovieDetail(movie: movieDetailToShow, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeIn, value: 0.5)
                    .transition(.opacity)
            }
            
            if showTopRowSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 40) {
                        
                        Spacer()
                        
                        ForEach(HomeTopRow.allCases, id: \.self) { homeTopRow in
                            Button {
                                topRowSelection = homeTopRow
                                showTopRowSelection = false
                            } label: {
                                if homeTopRow == topRowSelection {
                                    Text(homeTopRow.rawValue)
                                        .bold()
                                } else {
                                    Text(homeTopRow.rawValue)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            showTopRowSelection = false
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        }
                        .padding(.bottom, 40)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
            
            if showGenreSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 40) {
                        
                        Spacer()
                        
                        ScrollView {
                            ForEach(viewModel.allGenres, id: \.self) { genre in
                                Button {
                                    homeGenre = genre
                                    showGenreSelection = false
                                } label: {
                                    if homeGenre == genre {
                                        Text(genre.rawValue)
                                            .bold()
                                    } else {
                                        
                                        Text(genre.rawValue)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding(.bottom, 40)
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            showGenreSelection = false
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        }
                        .padding(.bottom, 40)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
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
    
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    @Binding var showGenreSelection: Bool
    @Binding var showTopRowSelection: Bool
    
    var body: some View {
        switch topRowSelection {
        case .home:
            HStack {
                Button {
                    topRowSelection = .home
                } label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button {
                    topRowSelection = .tvShows
                } label: {
                    Text("TV Shows")
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button {
                    topRowSelection = .movies
                } label: {
                    Text("Movies")
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button {
                    topRowSelection = .myList
                } label: {
                    Text("My List")
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
            
        case .myList, .tvShows, .movies:
            HStack {
                Button {
                    topRowSelection = .home
                } label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }
                .buttonStyle(PlainButtonStyle())
                
                HStack(spacing: 20) {
                    Button {
                        showTopRowSelection = true
                    } label: {
                        Text(topRowSelection.rawValue)
                            .font(.system(size: 18))
                        Image(systemName: "triangle.fill")
                            .font(.system(size: 10))
                            .rotationEffect(.degrees(180), anchor: .center)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Button {
                        showGenreSelection = true
                    } label: {
                        HStack {
                            Text(homeGenre.rawValue)
                                .font(.system(size: 12))
                            
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 6))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
        }
    }
}

enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre: String {
    case AllGenres
    case Action
    case Comedy
    case Horror
    case Thriller
}


