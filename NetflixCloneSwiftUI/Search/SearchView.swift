//
//  SearchView.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 27/03/2023.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    
    @State private var searchText = ""
    
    var body: some View {
        //make a binding that takes a value from the search bar and observes the text and updates the searchText property
        let searchTextBinding = Binding {
            return searchText
        } set: {
            searchText = $0
            viewModel.updateSearchText(with: $0)
        }
        
        return ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(text: searchTextBinding, isLoading: $viewModel.isLoading)
                    .padding()
                
                ScrollView {
                    if viewModel.isShowingPopularMovies {
                        Text("Popular movies")
                    }
                    
                    if viewModel.viewState == .empty {
                        Text("empty")
                    }
                    
                    if viewModel.viewState == .ready && !viewModel.isShowingPopularMovies{
                        Text("ready")
                    }
                }
                
                Spacer()
            }
        }
        .foregroundColor(.white)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
