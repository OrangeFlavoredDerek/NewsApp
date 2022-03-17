//
//  VideoService.swift
//  NewsApp
//
//  Created by 陳峻琦 on 23/2/2022.
//

import Foundation
import Alamofire

struct VideoService {
    func list<T: Codable>(completion: @escaping ListCompletion<T>) {
        AF.request("http://172.20.10.3:8080/video/list").json(completion: completion)
    }
    
    //请求数据
    func info<T: Codable>(id:String, completion: @escaping DataCompletion<T>) {
        AF.request("http://172.20.10.3:8080/video/info?id=\(id)").json(completion: completion)
    }
}
