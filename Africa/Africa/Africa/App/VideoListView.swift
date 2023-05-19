//
//  VideoListView.swift
//  Africa
//
//  Created by Fabiola Correa Padilla on 08/03/23.
//

import SwiftUI

struct VideoListView: View {
    //Mark: PROPERTIES
   @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    //Mark: BODY
    var body: some View {
        NavigationView {
            List{
                ForEach(videos) { item in NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                    VideoListItemView (video: item)
                        .padding(.vertical, 8).padding(.vertical, 8)
                }
                }//:LOOP
            }//:LIST
            .listStyle(InsetGroupedListStyle()).navigationBarTitle("Videos", displayMode: .inline)
            .toolbar{ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {
                    //:SHUFFLE VIDEOS
                    videos.shuffle()
                    hapticImpact.impactOccurred()
                }//:Action
                ){
                    Image(systemName: "arrow.2.squarepath")
                }//:Button
            }//:ToolbarItem
                
            }//:TOOLBAR
        }//:NAVIGATION
    }
}

//Mark: PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
