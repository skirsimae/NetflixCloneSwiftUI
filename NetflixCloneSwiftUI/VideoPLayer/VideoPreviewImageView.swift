//
//  VideoPreviewImageView.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 13/03/2023.
//

import SwiftUI
import Kingfisher

struct VideoPreviewImageView: View {
    var imageURL: URL
    var videoURL: URL
    
    @State private var showingVideoPlayer = false
    
    var body: some View {
        ZStack {
            KFImage(imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Button {
                showingVideoPlayer = true
            } label: {
                Image(systemName: "play.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
            }
            .sheet(isPresented: $showingVideoPlayer) {
                SwiftUIVideoView(url: videoURL)
            }
        }
    }
}

struct VideoPreviewImageView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPreviewImageView(imageURL: randomExampleImageURL, videoURL: exampleVideoURL)
    }
}
