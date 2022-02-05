//
//  StudyPage.swift
//  NewsApp
//
//  Created by 陳峻琦 on 5/2/2022.
//

import SwiftUI

struct StudyPage: View {
    @State var tabIndex: CGFloat? = 0
    
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
            
            TabBarView(isScrollable: true, showIndicator: true, items: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"], selection: $tabIndex)
                .frame(height: 55)
                .background(Color.gray.opacity(0.1))
                .onChange(of: tabIndex) { newValue in
                    print(newValue ?? 0)
                }
            
            TabBarView(isScrollable: true, showIndicator: false, items: ["相关资讯", "视频课程"], selection: $tabIndex)
                .frame(height: 55)
                .onChange(of: tabIndex) { newValue in
                    print(newValue ?? 0)
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
