//
//  SwiperView.swift
//  NewsApp
//
//  Created by 陳峻琦 on 6/2/2022.
//

import SwiftUI

struct SwiperView<SwiperItem:View>:View {
    
    var items:[SwiperItem]
    @Binding var currentPage:Int
    
    private let timer = Timer.publish(every: 3, on: .current, in: .common).autoconnect()
    
    var body: some View{
        ZStack(alignment:.bottom) {
            Swiper(items: items, currentPage: $currentPage)
            SwiperController(numOfPages: items.count, currentPage: $currentPage)
        }
        .aspectRatio(7/3,contentMode: .fit)
        .onReceive(timer, perform: { _ in
            currentPage += 1
            if currentPage >= items.count{
                currentPage = 0
            }
        })
    }
}


