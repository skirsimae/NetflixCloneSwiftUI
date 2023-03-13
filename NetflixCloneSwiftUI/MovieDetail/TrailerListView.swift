//
//  TrailerListView.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 13/03/2023.
//

import SwiftUI

struct TrailerListView: View {
    var trailers: [Trailer]
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            ForEach(trailers) { trailer in
                VStack(alignment: .leading) {
                    VideoPreviewImageView(imageURL: trailer.thumbnailImageURL, videoURL: trailer.videoURL)
                        .frame(maxWidth: screen.width)
                    
                    Text(trailer.name)
                        .font(.headline)
                }
                .foregroundColor(.white)
            }
        }
    }
}

struct TrailerListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            TrailerListView(trailers: exampleTrailers)
        }
    }
}
