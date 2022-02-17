//
//  ArticleDetail.swift
//  NewsApp
//
//  Created by 陳峻琦 on 17/2/2022.
//

import SwiftUI

struct ArticleDetail: View {
    @StateObject private var articleVM = ArticleViewModel()
    var id: String
    
    var body: some View {
        WebView(htmlString: articleVM.articleContent, baseURL: URL(string: "https://new.qq.com/")!)
            .navigationTitle("资讯详情")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                articleVM.info(id: self.id)
            }
    }
}

//struct ArticleDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticleDetail()
//    }
//}
