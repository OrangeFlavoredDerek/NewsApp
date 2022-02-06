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
            
            TabBarView(isScrollable: true, showIndicator: true, items: ["思想政治", "法律法规", "职业道德", "诚信自律"], selection: $tabIndex)
                .frame(height: 55)
                .background(Color.gray.opacity(0.1))
                .onChange(of: tabIndex) { newValue in
                    print(newValue ?? 0)
                }
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    TabBarView(isScrollable: true, showIndicator: false, items: ["相关资讯", "视频课程"], selection: $tabIndex)
                        .frame(height: 55)
                        .onChange(of: tabIndex) { newValue in
                            print(newValue ?? 0)
                    }
                }
                //            CarouselView()
                //                .aspectRatio(7/3, contentMode: .fit)
                SwiperView(items: [Image("banner1").resizable(), Image("banner2").resizable(), Image("banner3").resizable(), Image("banner4").resizable()], currentPage: $currentPage)
                    .aspectRatio(7/3, contentMode: .fit)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
            
            Spacer()
        }
    }
}

struct StudyPage_Previews: PreviewProvider {
    static var previews: some View {
        StudyPage()
    }
}
