//
//  ArticleDetail.swift
//  NewsApp
//
//  Created by 陳峻琦 on 17/2/2022.
//

import SwiftUI

struct ArticleDetail: View {
    @State var fontValue: Double = 100.0
    @State var isPresent: Bool = false
    @StateObject private var articleVM = ArticleViewModel()
    var id: String
    
    var body: some View {
        WebView(htmlString: articleVM.articleContent, baseURL: URL(string: "https://new.qq.com/")!, store: articleVM.webViewStore)
            .navigationTitle("资讯详情")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                Image(systemName: "textformat.size")
                    .onTapGesture {
                        isPresent.toggle()
                    }
            })
            .bottomSheet(isPresent: $isPresent, title: Text("字体大小"), content: {
                VStack {
                    HStack {
                        Text("小")
                        Spacer()
                        
                        Text("标准")
                        Spacer()
                        
                        Text("大")
                        Spacer()
                        
                        Text("较大")
                        Spacer()
                        
                        Text("特大")
                    }
                    Slider(value: $fontValue, in: 75...175, step: 25)
                        .onChange(of: fontValue) { newValue in
                            articleVM.zoom(value: newValue)
                        }
                }
                .font(.system(size: 14))
                .padding()
                .padding(.horizontal, 12)
            })
            .loading(present: $articleVM.loaded)
            .toast(present: $articleVM.showToast, message: $articleVM.message)
            .onAppear {
                articleVM.info(id: self.id)
                fontValue = articleVM.articleFontSizeSetting * 100.0
            }
    }
}

//struct ArticleDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticleDetail()
//    }
//}
