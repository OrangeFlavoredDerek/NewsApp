//
//  Article.swift
//  NewsApp
//
//  Created by 陳峻琦 on 6/2/2022.
//

import Foundation

struct Article: Codable, Identifiable, Hashable {
    var id: String
    var title: String
    var mediaName: String
    var publishTime: String
    var content: String
}

extension Article {
    static func mock(id: String, title: String) -> Article {
        Article(id: id, title: title, mediaName: "PeopleDaily", publishTime: "2022-02-16 00:00:00", content: "")
    }
}
