//
//  LoadingViewModifier.swift
//  NewsApp
//
//  Created by 陳峻琦 on 23/2/2022.
//

import Foundation
import SwiftUI

//加载框
struct LoadingViewModifier: ViewModifier {
    @Binding var present: Bool // 是否显示加载框
    
    func body(content: Content) -> some View {
        ZStack {
            //使用者
            content
                .zIndex(0)
            
            //加载框内容
            VStack {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .padding(16)
                    .background(.black)
                    .cornerRadius(10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray.opacity(0.1))
            .opacity(present ? 0 : 1)
            .zIndex(1)
        }
    }
}

extension View {
    func loading(present: Binding<Bool>) -> some View {
        self.modifier(LoadingViewModifier(present: present))
    }
}
