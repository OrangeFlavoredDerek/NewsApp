//
//  Response.swift
//  NewsApp
//
//  Created by 陳峻琦 on 10/2/2022.
//

import Foundation

struct DataResponse<T: Codable>: Codable {
    var code = 200
    var msg = ""
    var data: T?
}

struct ListResponse<T: Codable>: Codable {
    var code = 200
    var msg = ""
    var data: [T]?
}
