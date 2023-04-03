//
//  ComingSoonView.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 30/03/2023.
//

import SwiftUI

struct ComingSoonView: View {
    @State private var showNotificationList = false
    @State private var movieDetailToShow: Movie? = nil
    
    @ObservedObject var viewModel = ComingSooViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    
                    ScrollView {
                        LazyVStack {
                            NotificationBar(showNotificationList: $showNotificationList)
                            ForEach(viewModel.movies) { movie in
                                ComingSoonRow(movie: movie, movieDetailToShow: $movieDetailToShow)
                                    .frame(height: 400)
                            }
                        }
                    }
                    .foregroundColor(.white)
                }
            }
            .navigationDestination(isPresented: $showNotificationList) {
                Text("Notification List")
            }
        }
    }
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonView()
    }
}
