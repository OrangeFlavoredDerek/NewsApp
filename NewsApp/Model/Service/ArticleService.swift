//
//  ArticleService.swift
//  NewsApp
//
//  Created by 陳峻琦 on 16/2/2022.
//

import Foundation
import Alamofire

struct ArticleService {
    func list<T: Codable>(offset: Int, completion: @escaping ListCompletion<T>) {
        AF.request("http://192.168.0.101:8080/article/list?offset=\(offset)").json(completion: completion)
    }
    
    func info<T: Codable>(id: String, completion: @escaping DataCompletion<T>) {
        AF.request("http://192.168.0.101:8080/article/info?id=\(id)").json(completion: completion)
    }
}
