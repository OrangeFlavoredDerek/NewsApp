//
//  ArticleListView.swift
//  NewsApp
//
//  Created by 陳峻琦 on 6/2/2022.
//

import SwiftUI

struct ArticleListView: View {
    var articles: [Article]
    
    var body: some View {
        ForEach(articles) { article in
            Text(article.title)
                .font(.system(size: 16))
            .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255, opacity: 1))
            HStack {
                Text(article.mediaName)
                    .font(.system(size: 10))
                Spacer()
                Text(article.publishTime)
                    .font(.system(size: 10))
            }
            .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255, opacity: 1))
        }
        .padding([.horizontal, .top])
    }
}