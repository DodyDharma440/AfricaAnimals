//
//  VideoPlayerUtils.swift
//  AfricaAnimals
//
//  Created by Dodi Aditya on 12/05/23.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat)
    if url != nil {
        videoPlayer = AVPlayer(url: url!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
