//
//  Category.swift
//  NewsApp
//
//  Created by 陳峻琦 on 10/2/2022.
//

import Foundation

struct Category: Codable {
    var id: String
    var name: String
}

extension Category {
    static let mock = Category(id: UUID().uuidString, name: "分类数据")
}
