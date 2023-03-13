//
//  CustomTabSwitcherView.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 13/03/2023.
//

import SwiftUI

struct CustomTabSwitcherView: View {
    
    @State private var currentTab: CustomTab = .episode
    
    var tabs: [CustomTab]
    var movie: Movie
    
    func getWidth(for tab: CustomTab) -> CGFloat {
        let string = tab.rawValue
        return string.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }
    
    var body: some View {
        VStack {
            //Scrollable picker
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(tabs, id: \.self) { tab in
                        VStack {
                            //Red bar
                            Rectangle()
                                .frame(width: getWidth(for: tab), height: 6)
                                .foregroundColor(tab == currentTab ? .red : .clear)
                            
                            //Button
                            Button {
                                currentTab = tab
                            } label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(tab == currentTab ? .white : .gray)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: getWidth(for: tab), height: 30)
                        }
                    
                    }
                }
            }
            
            //Selected View
            
            switch currentTab {
            case .episode:
                Text("EPISODES")
            case .trailer:
                Text("Trailers")
            case .more:
                MoreLikeThisView(movies: movie.moreLikeThisMovies)
            }
        }
        .foregroundColor(.white)
    }
}

enum CustomTab: String {
    case episode = "EPISODES"
    case trailer = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}

struct CustomTabSwitcherView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            CustomTabSwitcherView(tabs: [.episode, .trailer, .more], movie: exampleMovie1)
        }
    }
}
