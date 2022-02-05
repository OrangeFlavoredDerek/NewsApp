//
//  TabBarView.swift
//  NewsApp
//
//  Created by 陳峻琦 on 5/2/2022.
//

import SwiftUI

struct TabBarItem: Identifiable {
    var id = UUID()
    var index: CGFloat = 0
    var text: String = ""
}

//标签栏
struct TabBarView: View {
    var isScrollable: Bool = false
    var showIndicator: Bool = true
    var items: [String]
    private var tabItems: [TabBarItem] {
        var index = -1
        return items.map { strItem -> TabBarItem in
            index += 1
            return TabBarItem(index: CGFloat(index), text: strItem)
        }
    }
    @Binding var selection: CGFloat?
    
    var body: some View {
        GeometryReader { reader in
            if isScrollable {
                ScrollView(.horizontal, showsIndicators: false) {
                    ScrollViewReader { proxy in
                        TabBarSubView(items: tabItems, proxy: proxy, height: reader.size.height, width: reader.size.width, showIndicator: showIndicator, selection: $selection)
                    }
                }
            } else {
                TabBarSubView(items: tabItems, height: reader.size.height, width: reader.size.width, showIndicator: showIndicator, selection: $selection)
            }
        }
    }
}

struct TabBarSubView: View {
    var items: [TabBarItem]
    var proxy: ScrollViewProxy?
    var height: CGFloat
    var width: CGFloat
    var showIndicator: Bool = true
    
    let indicatorHeight: CGFloat = 2
    var itemWidth: CGFloat {//使元素等间距
        let screenWidth = UIScreen.main.bounds.width
        if items.count > 4 {
            return screenWidth / 4
        } else {
            return screenWidth / CGFloat(items.count)
        }
    }
    @State private var selectedIndex: CGFloat = 0
    @Binding var selection: CGFloat?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                ForEach(items) { item in
                    Text(item.text)
                        .frame(width: itemWidth)
                        .foregroundColor(selectedIndex == item.index ? Color(.sRGB, red: 20/255.0, green: 158/255.0, blue: 231/255.0, opacity: 1) : Color(.sRGB, red: 102/255.0, green: 102/255.0, blue: 102/255.0, opacity: 1))
                        .onTapGesture {
                            selectedIndex = item.index
                            selection = item.index
                            
                            withAnimation {
                                proxy?.scrollTo(item.id, anchor: .center)
                            }
                        }
                        .id(item.id)
                        .frame(height: height)
                }
            }
            
            if showIndicator {
                Divider()
                    .frame(width: itemWidth, height: indicatorHeight)
                    .background(Color(.sRGB, red: 20/255.0, green: 158/255.0, blue: 231/255.0, opacity: 1))
                    .offset(x: selectedIndex * itemWidth)
                    .animation(.easeInOut(duration: 0.3), value: selectedIndex)
            }
        }
        .onAppear {
            selectedIndex = selection ?? 0
        }
    }
}
