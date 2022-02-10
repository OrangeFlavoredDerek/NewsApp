//
//  CategoryService.swift
//  NewsApp
//
//  Created by 陳峻琦 on 10/2/2022.
//

import Foundation
import Alamofire

struct CategoryService {
    func list<T: Codable>(completion: @escaping (ListCompletion<T>)) {
        AF.request("http://192.168.8.103:8080/category/list").json(completion: completion)
    }
}