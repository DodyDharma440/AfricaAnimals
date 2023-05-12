//
//  VideoPlayerView.swift
//  AfricaAnimals
//
//  Created by Dodi Aditya on 12/05/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: - PROPERTY
    
    var selectedVideo: String
    var videoName: String
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: selectedVideo, fileFormat: "mp4"))
                .overlay(
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding(.top, 6)
                        .padding(.horizontal, 8)
                    , alignment: .topLeading
                )
        } // VStack
        .accentColor(.accentColor)
        .navigationBarTitle(videoName, displayMode: .inline)
    }
}

// MARK: - PREVIEW

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(selectedVideo: "lion", videoName: "Lion")
        }
    }
}
