//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Fabiola Correa Padilla on 29/03/23.
//

import SwiftUI
import AVKit


struct VideoPlayerView: View {
    //:PROPERTIES
    var videoSelected: String
    var videoTitle: String
    //:BODY
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")){
                //Text(videoTitle)
            }.overlay(
                Image("logo").resizable().scaledToFit().frame(width: 32, height: 32).padding(.top, 6).padding(.horizontal, 8), alignment: .topLeading
            )
        }//:VStack
        .accentColor(.accentColor).navigationBarTitle(videoTitle, displayMode: .inline)
    }
}
//:PREVIEW
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
