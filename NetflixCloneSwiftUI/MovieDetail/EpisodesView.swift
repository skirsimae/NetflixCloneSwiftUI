//
//  EpisodesView.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 14/03/2023.
//

import SwiftUI

struct EpisodesView: View {
    var episodes: [Episode]
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    func getEpisodes(for season: Int) -> [Episode] {
        return episodes.filter ( { $0.season == season })
    }
    var body: some View {
        VStack {
            //Season picker
            HStack {
                Button {
                    showSeasonPicker = true
                } label: {
                    Group {
                        Text("Season 1")
                        Image(systemName: "chevron.down")
                    }
                    .font(.system(size: 16))
                }

                
                Spacer()
            }
            
            //Episode list
            ForEach(getEpisodes(for: selectedSeason)) { episode in
                Text("Test")
            }
            
            Spacer()
            
        }
        .foregroundColor(.white)
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            EpisodesView(episodes: allExampleEpisodes, showSeasonPicker: .constant(false), selectedSeason: .constant(1))
        }
    }
}
