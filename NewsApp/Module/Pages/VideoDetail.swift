//
//  VideoDetail.swift
//  NewsApp
//
//  Created by 陳峻琦 on 25/2/2022.
//

import SwiftUI
import AVKit

struct VideoDetail: View {
    @StateObject private var videoVM = VideoViewModel()
    @State var webViewContentHeight: CGFloat = 0.0
    
    var videoId: String
    var title: String
    
    var body: some View {
        var avPlayer: AVPlayer? = nil
        if let url = URL(string: videoVM.videoURL) {
            avPlayer = AVPlayer(url: url)
        }
        
        return VStack {
            VideoPlayer(player: avPlayer)
                .aspectRatio(16/9, contentMode: .fit)
            
            ScrollView {
                LazyVStack {
                    Text(title)
                        .font(.system(size: 16))
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Color.gray.opacity(0.3)
                        .frame(height: 10)
                    
                    WebView(htmlString: videoVM.videoDesc, scrollHeight: $webViewContentHeight)
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
            }
        }
        
        .navigationTitle("详情")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            videoVM.info(videoId: videoId)
        }
    }
}

//struct VideoDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoDetail()
//    }
//}
