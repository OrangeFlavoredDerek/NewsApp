//
//  ArticleListView.swift
//  NewsApp
//
//  Created by 陳峻琦 on 6/2/2022.
//

import SwiftUI

struct ArticleListView: View {
    @StateObject private var articleVM = ArticleViewModel()
    
    var body: some View {
        ForEach(articleVM.articles) { article in
            NavigationLink {
                ArticleDetail(id: article.id)
            } label: {
                VStack(alignment: .leading, spacing: 5) {
                    Text(article.title)
                        .font(.system(size: 16))
                        .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255, opacity: 1))
                        .padding(.bottom, 8)
                    HStack {
                        Text(article.mediaName)
                            .font(.system(size: 10))
                        Spacer()
                        Text(article.publishTime)
                            .font(.system(size: 10))
                    }
                    .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255, opacity: 1))
                }
                .redacted(reason: articleVM.listLoaded ? [] : .placeholder)
            }
        }
        .padding([.horizontal, .top])
    }
}
