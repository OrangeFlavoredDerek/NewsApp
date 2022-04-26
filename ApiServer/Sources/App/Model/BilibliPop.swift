//
//  File.swift
//  
//
//  Created by 陳峻琦 on 26/4/2022.
//

import Foundation

struct BilibliPop: Codable {
    var aid: Int?
    var bid: String
    var pic: String
    var title: String
    var desc: String
    var duration: String
}

struct BilibiliPopData: Decodable {
    var list: [BilibliPop]
}

struct BilibiliPopRootNode: Decodable {
    var code: Int
    var message: String
    var ttl: Int
    var data: BilibiliPopData
}
