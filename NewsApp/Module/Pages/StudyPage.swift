//
//  StudyPage.swift
//  NewsApp
//
//  Created by 陳峻琦 on 5/2/2022.
//

import SwiftUI

struct StudyPage: View {
    @State var tabIndex: CGFloat? = 0
    @State var currentPage: Int = 0
    @State var showNewsList: Bool = true
    @State var typeIndex: CGFloat? = 0
    
    var body: some View {
        VStack(spacing: 0) {
            //标题栏
            HStack {
                Image("tool_bar_left_icon")
                    .resizable()
                    .frame(width: 69, height: 25)
                
                //搜索框
                HStack {
                    Image(systemName: "magnifyingglass")
                    Text("搜索感兴趣的内容")
                    Spacer()
                }
                .padding(.horizontal, 4)
                .padding(.vertical, 5)
                .background(Color.white.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                
                HStack {
                    Text("学习\n进度")
                    Text("100%")
                }
                .foregroundColor(.white)
                
                Image(systemName: "bell")
                
            }
            .AppBarStyle()
            
            //标签栏
            TabBarView(isScrollable: true, showIndicator: true, items: ["思想政治", "法律法规", "职业道德", "诚信自律"], selection: $tabIndex)
                .frame(height: 55)
                .background(Color.gray.opacity(0.1))
                .onChange(of: tabIndex) { newValue in
                    print(newValue ?? 0)
                }
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    //标签栏
                    TabBarView(isScrollable: true, showIndicator: false, items: ["相关资讯", "视频课程"], selection: $typeIndex)
                        .frame(height: 55)
                        .onChange(of: typeIndex) { newValue in
                            showNewsList = newValue == 0
                        }
                }
                
                //轮播图
                SwiperView(items: [Image("banner1").resizable(), Image("banner2").resizable(), Image("banner3").resizable(), Image("banner4").resizable()], currentPage: $currentPage)
                    .aspectRatio(7/3, contentMode: .fit)
                    .cornerRadius(12)
                    .padding(.horizontal)
                
                if showNewsList {
                    ArticleListView(articles: [Article(id: "0", title: "人社部向疫情防控期参与复工复产的劳动者表达敬佩： 您辛苦了", mediaName: "人民日报", publishTime: "2020-02-10", content: "人社部向疫情防控期参与复工复产的劳动者表达敬佩： 您辛苦了人社部向疫情防控期参与复工复产的劳动者表达敬佩： 您辛苦了人社部向疫情防控期参与复工复产的劳动者表达敬佩： 您辛苦了人社部向疫情防控期参与复工复产的劳动者表达敬佩： 您辛苦了"),
                        Article(id: "1", title: "人社部向疫情防控期参与复工复产的劳动者表达敬佩： 您辛苦了", mediaName: "人民日报", publishTime: "2020-02-10", content: "人社部向疫情防控期参与复工复产的劳动者表达敬佩： 您辛苦了人社部向疫情防控期参与复工复产的劳动者表达敬佩： 您辛苦了人社部向疫情防控期参与复工复产的劳动者表达敬佩： 您辛苦了人社部向疫情防控期参与复工复产的劳动者表达敬佩： 您辛苦了"),
                        Article(id: "2", title: "人社部向疫情防控期参与复工复产的劳动者表达敬佩： 您辛苦了", mediaName: "人民日报", publishTime: "2020-02-10", content: "人社部向疫情防控期参与复工复产的劳动者表达敬佩： 您辛苦了人社部向疫情防控期参与复工复产的劳动者表达敬佩： 您辛苦了人社部向疫情防控期参与复工复产的劳动者表达敬佩： 您辛苦了人社部向疫情防控期参与复工复产的劳动者表达敬佩： 您辛苦了")])
                } else {
                    VideoListView(videos: [VideoModel(id: "0", title: "人社部向疫情防控期参与复工复产的劳动者表达敬佩： 您辛苦了", duration: "10:00:00", imgURL: "https://d6n3s4g6.ssl.hwcdn.net/content/180716/0006_400.jpg")])
                }
            }
            
            Spacer()
        }
    }
}

//struct StudyPage_Previews: PreviewProvider {
//    static var previews: some View {
//        StudyPage()
//    }
//}
