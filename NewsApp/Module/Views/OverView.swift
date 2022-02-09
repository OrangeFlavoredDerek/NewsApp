//
//  OverView.swift
//  NewsApp
//
//  Created by 陳峻琦 on 8/2/2022.
//

import SwiftUI

//任务页顶部视图
struct OverView: View {
    let screenWidth = UIScreen.main.bounds.width
    let safeAreaInsets = UIApplication.shared.windows.first?.safeAreaInsets
    let padding: CGFloat = 8
    
    private var circleHeight: CGFloat {
        screenWidth / 2 - padding * 2 - (screenWidth / 2 - padding * 2) / 4
    }
    private var circleOffsetY: CGFloat {
        (screenWidth / 2 - padding * 2) / 4 / 2
    }
    
    var body: some View {
        VStack {
            Text("学习任务")
                .frame(height: 45)
                .font(.system(size: 18))
            Text("学习周期: 2022.01.01 - 2022.12.31")
                .font(.system(size: 12))
            
            ZStack(alignment: .center) {
                Circle()
                    .trim(from: 0.4, to: 1.0)
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .rotation(.degrees(18.5))
                    .frame(width: screenWidth / 2 - padding * 2, height: screenWidth / 2 - padding * 2, alignment: .center)
                    .foregroundColor(Color.gray.opacity(0.3))
                    .offset(y: circleOffsetY)
                
                Circle()
                    .trim(from: 0.4, to: 0.6)
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .rotation(.degrees(18.5))
                    .frame(width: screenWidth / 2 - padding * 2, height: screenWidth / 2 - padding * 2, alignment: .center)
                    .offset(y: circleOffsetY)
                
                VStack {
                    Text("10000分")
                        .font(.system(size: 36))
                    Text("学年积分")
                        .font(.system(size: 12))
                }
            }
            .padding(.top, padding)
            .frame(height: circleHeight)
            
            HStack {
                Spacer()
                
                VStack {
                    Text("13500分")
                        .font(.system(size: 16))
                    Text("学年规定积分")
                        .font(.system(size: 12))
                }
                
                Spacer()
                
                VStack {
                    Text("3500分")
                        .font(.system(size: 16))
                    Text("还差")
                        .font(.system(size: 12))
                }
                
                Spacer()
            }
        }
        .padding(.top, safeAreaInsets?.top ?? 0)
        .foregroundColor(.white)
    }
}
