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
        AF.request("http://192.168.8.106:8080/article/list?offset=\(offset)").json(completion: completion)
    }
}