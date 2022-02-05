//
//  StudyPage.swift
//  NewsApp
//
//  Created by 陳峻琦 on 5/2/2022.
//

import SwiftUI

struct StudyPage: View {
    var body: some View {
        VStack {
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
            
            Spacer()
        }
    }
}

struct StudyPage_Previews: PreviewProvider {
    static var previews: some View {
        StudyPage()
    }
}
