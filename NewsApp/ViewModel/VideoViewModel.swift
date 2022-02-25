//
//  VideoViewModel.swift
//  NewsApp
//
//  Created by 陳峻琦 on 23/2/2022.
//

import Foundation

class VideoViewModel: ObservableObject {
    private let service = VideoService()
    
    //文章列表数据
    @Published var videoList: [VideoModel] = Array(generating: { index in
            .mock(id: UUID().uuidString, title: String(repeating: "视频标题", count: Int.random(in: 5...8)))
    }, count: 10)
    
    //列表数据是否加载完成
    @Published private(set) var listLoaded: Bool = false
    
    //视频路径
    @Published private(set) var videoURL: String = ""
    
    //视频简介
    @Published private(set) var videoDesc: String = ""
    
    init() {
        list()
    }
    
    private func list() {
        service.list { (result: [VideoModel]?, msg, code) in
            guard let data = result else {
                return
            }
            self.listLoaded = true
            self.videoList = data
        }
    }
    
    func info(videoId: String) {
        service.info(id: videoId) { (result: VideoModel?, msg, code) in
            guard let data = result else {
                return
            }
            //视频地址
            self.videoURL = data.video
            //构造详情
            self.videoDesc =
                """
                \(htmlHeader)
                <div class="videoContainer">\(data.desc)</div>
                \(htmlFooter)
                """
        }
    }
}
