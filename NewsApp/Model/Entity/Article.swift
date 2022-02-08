//
//  Article.swift
//  NewsApp
//
//  Created by 陳峻琦 on 6/2/2022.
//

import Foundation

struct Article: Codable, Identifiable {
    var id: String
    var title: String
    var mediaName: String
    var publishTime: String
    var content: String
}
