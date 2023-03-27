//
//  SearchViewModel.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 27/03/2023.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var viewState: ViewState = .ready
    @Published var popularMovies: [Movie] = []
    @Published var searchResults: [Movie] = []
    @Published var isShowingPopularMovies = true
    
    public func updateSearchText(with text: String) {
        setViewState(to: .loading)
        
        if text.count > 0 {
            isShowingPopularMovies = false
            getSearchResults(for: text)
        } else {
            isShowingPopularMovies = true
        }
    }
    
    private func getPopularMovies() {
        self.popularMovies = generateMovies(40)
    }
    
    private func getSearchResults(for text: String) {
        let haveResults = Int.random(in: 0...3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if haveResults == 0 {
                //empty view
                self.searchResults = []
                self.setViewState(to: .empty)
            } else {
                // ready view
                let movies = generateMovies(21)
                self.searchResults = movies
                self.setViewState(to: .ready)
            }
        }
    }
    
    private func setViewState(to state: ViewState) {
        DispatchQueue.main.async {
            self.viewState = state
            self.isLoading = state == .loading
        }
    }
}


enum ViewState {
    case empty
    case loading
    case ready
    case error
}
