//
//  SwiperView.swift
//  NewsApp
//
//  Created by 陳峻琦 on 5/2/2022.
//

import SwiftUI

//https://juejin.cn/post/6898258968775245837#heading-6

struct CarouselView: View {
    private let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    let colors: [Color] = [.blue, .green, .yellow, .red, .pink, .purple]
    var loopColors: [Color] {
        return [colors.last!] + colors + [colors.first!]
    }
    @State var isAnimation: Bool = true
    @State var dragOffset: CGFloat = .zero
    @State var currentIndex: Int = 1// 当前显示的位置索引
    
    var body: some View {
        let width = UIScreen.main.bounds.width - 40
        let spacing: CGFloat = 10
        // 单个子视图偏移量 = 单个视图宽度 + 视图的间距
        // 如果每个子视图的偏移量为 width，那么拖动几次后，上一个视图还是会显示在当前窗口中，
        // 所以每个子视图的偏移量都要加上他的 spacing。
        // 这样每次拖动后，原先的子视图一定会被隐藏，新的也会全部展示出来
        // 而当前位置的偏移量就等于：当前显示的索引 ✖️ 偏移量
        let currentOffset = CGFloat(currentIndex) * (width + spacing)
        let defaultPadding: CGFloat = 20
        
        GeometryReader { proxy in
            HStack(alignment: .center, spacing: spacing) {
                ForEach(loopColors, id: \.self) { color in
                    color
                        .frame(width: width)
                        .frame(height: color.id == loopColors[currentIndex].id ? proxy.size.height : proxy.size.height * 0.8)
                }
            }
            .frame(width: proxy.size.width,
                   height: proxy.size.height,
                   alignment: .leading)  // 重要，必须实现
            .offset(x: defaultPadding + dragOffset - currentOffset) //循环滚动之前，需要先给第一个子视图添加左边距，这样就能看到当前子视图的上一个和下一个视图
            .gesture(dragGesture)
            .animation(.spring(), value: currentIndex)
            
            .onChange(of: currentIndex, perform: { value in
                //currentIndex 达到循环临界值的时候隐藏动画，不需要的时候再开启动画
                isAnimation = true
                if value == 0 {
                    currentIndex = loopColors.count - 2
                    isAnimation.toggle()
                } else if value == loopColors.count - 1 {
                    currentIndex = 1
                    isAnimation.toggle()
                }
            })
            .onReceive(timer, perform: { _ in
                currentIndex += 1
            })
        }
        .frame(height: 200)
    }
}

extension CarouselView {
    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { changeValue in
                isAnimation = true
                dragOffset = changeValue.translation.width
            }
            .onEnded { endValue in
                dragOffset = .zero
                
                // 拖动右滑，偏移量增加，显示 index 减少
                if endValue.translation.width > 50 {
                    currentIndex -= 1
                }
                // 拖动左滑，偏移量减少，显示 index 增加
                if endValue.translation.width < -50 {
                    currentIndex += 1
                }
                // 防止越界
                currentIndex = max(min(currentIndex, loopColors.count - 1), 0)
            }
    }
}

extension Color: Identifiable {
    public var id: Color {
        self
    }
}


