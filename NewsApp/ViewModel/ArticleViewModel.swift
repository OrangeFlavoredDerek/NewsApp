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
    
    //新闻详情信息
    @Published private(set) var articleContent: String = ""
    
    private var offset = 1
    
    let htmlHeader = """
                            <html>
                                <head>
                                <meta charset="utf-8">
                                <meta name="viewport" content="width=device-width,initial-scale=1.0">
                                <style>
                                    img{
                                       max-width: 100% !important;
                                    }
                                </style>
                                </head>
                                <body>
                        """
    
    let htmlFooter =
                        """
                            </body>
                            </html>
                        """
    
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
    
    func info(id: String) {
        service.info(id: id) { (data: Article?, msg, code) in
            guard let article = data else {
                return
            }
            
            //MARK: WebView 渲染 html，时间比较慢，在这个时间段的时候 loading 已经消失，导致产生一段时间的空白，尝试是否能解决这一段时间的空白
            self.articleContent = """
                \(self.htmlHeader)
                <div class="articleContainer">\(article.content)</div>
                \(self.htmlFooter)
                """
        }
    }
}
