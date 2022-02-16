//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by 陳峻琦 on 16/2/2022.
//

import Foundation
import SwiftUI

class ArticleViewModel: ObservableObject {
    private var service = ArticleService()
    
    //新闻列表数据
    @Published var articles: [Article] = Array(generating: { index in
            .mock(id: "\(index)", title: String(repeating: "Title", count: Int.random(in: 5...8)))
    }, count: 10)
    @Published private(set) var listLoaded: Bool = false
    
    private var offset = 1
    
    init() {
        list()
    }
    
    private func list() {
        service.list(offset: offset) { (list: [Article]?, msg, code) in
            guard let data = list else { return }
            self.articles = data
            self.listLoaded = true
        }
    }
}
