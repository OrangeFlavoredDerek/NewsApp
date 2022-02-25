//
//  VideoListView.swift
//  NewsApp
//
//  Created by 陳峻琦 on 6/2/2022.
//

import SwiftUI

struct VideoListView: View {
    @StateObject private var videoVM = VideoViewModel()
    
    var body: some View {
        ForEach(videoVM.videoList) { video in
            NavigationLink {
                VideoDetail(videoId: video.id, title: video.title)
            } label: {
                HStack {
                    AsyncImage(video.imgURL) {
                        Text("loading")
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .frame(width: 100, height: 56.25, alignment: .center)
                    
                    VStack(alignment: .leading) {
                        Text(video.title)
                            .font(.system(size: 16))
                            .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255, opacity: 1))
                        Spacer()
                        HStack {
                            Text(Image(systemName: "video.circle"))+Text("视频课程")
                            
                            Spacer()
                            Text(video.duration)
                        }
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
                    }
                }
                .padding([.top, .horizontal])
                .redacted(reason: videoVM.listLoaded ? [] : .placeholder)
            }

        }
    }
}
