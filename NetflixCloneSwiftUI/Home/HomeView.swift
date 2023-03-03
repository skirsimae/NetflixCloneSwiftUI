//
//  HomeView.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 03/03/2023.
//

import SwiftUI

struct HomeView: View {
    var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            

            //Main VStack
            //Lazy VStack will request the images on scroll
            ScrollView(showsIndicators: false) {
                LazyVStack {
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
