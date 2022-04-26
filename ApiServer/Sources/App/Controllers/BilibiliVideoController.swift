//
//  File.swift
//  
//
//  Created by 陳峻琦 on 26/4/2022.
//

import Foundation
import Vapor
import Kanna

class BiliVideoController {
    func list(req: Request) -> EventLoopFuture<String> {
        let urlStr: String = "https://api.bilibili.com/x/web-interface/popular?ps=20&pn=1"
        
        return req.client.get(URI(string: urlStr))
            .map { res in
                var result: [Video4App] = []
                
                if res.status == .ok {
                    guard let body = res.body else {
                        return ResponseWrapper<DefaultResponseObj>(code: .failedParamError, msg: "网络请求出错")
                            .makeResponse()
                    }
                    
                    let data = Data(buffer: body)
                    
                    guard let netData = try? JSONDecoder().decode(BilibiliPopRootNode.self, from: data) else {
                        return ResponseWrapper<DefaultResponseObj>(code: .failedParamError, msg: "网络请求出错")
                            .makeResponse()
                    }
                    
                    if netData.code == 0 {
                        result = netData.data.list.map { bv -> Video4App in
                            Video4App(title: bv.title, imgUrl: bv.pic, duration: bv.duration, id: bv.bid, video: "", desc: bv.desc)
                        }
                    }
                } else {
                    return ResponseWrapper<DefaultResponseObj>(code: .failedParamError, msg: "网络请求出错")
                        .makeResponse()
                }
                return ResponseWrapper(code: .success, data: result)
                    .makeResponse()
            }
    }
    
    func info(req: Request) -> String {
        guard let id = req.query["id"] as String? else {
            return ResponseWrapper<DefaultResponseObj>(code: .failedParamError)
                .makeResponse()
        }
        let urlStr = "https://www.bilibili.com/video/\(id)"
        
        guard let url = URL(string: urlStr), let doc = try? HTML(url: url, encoding: .utf8) else {
            return ResponseWrapper<DefaultResponseObj>(code: .failedParamError, msg: "网络请求出错")
                .makeResponse()
        }
        
        let htmlText = doc.body?.text ?? ""
        let startRange = htmlText.range(of: #"video:""#)?.upperBound ?? htmlText.startIndex
        let endRange = htmlText.range(of: #".mp4"#)?.lowerBound ?? htmlText.startIndex
        let videoUrl = htmlText[startRange...endRange]
        
        let video = "\(videoUrl)mp4"
        let divObj = doc.xpath("//div[@class='courseinfo']")
        var desc = ""
        if divObj.count > 0 {
            desc = divObj[0].toHTML ?? ""
        }
        let video4App = Video4App(title: "", imgUrl: "", duration: "", id: "", video: video, desc: desc)
        return ResponseWrapper(code: .success, data: video4App).makeResponse()
    }
}
