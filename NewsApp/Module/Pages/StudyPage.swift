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
    
    //分类ViewModel
    @StateObject private var categoryVM = CategoryViewModel()
    //分类数据
    private var categories: [String] {
        categoryVM.categories.map { category in
            category.name
        }
    }
    
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
            TabBarView(isScrollable: true, showIndicator: true, items: categories, selection: $tabIndex)
                .frame(height: 55)
                .background(Color.gray.opacity(0.1))
                .onChange(of: tabIndex) { newValue in
                    print(newValue ?? 0)
                }
                .redacted(reason: categoryVM.loaded ? [] : .placeholder) //加载完成前出现占位符
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    //标签栏
                    TabBarView(isScrollable: true, showIndicator: false, items: categoryVM.types, selection: $typeIndex)
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
                    ArticleListView()
                } else {
                    VideoListView()
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
