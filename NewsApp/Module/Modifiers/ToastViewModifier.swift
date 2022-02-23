//
//  ToastViewModifier.swift
//  NewsApp
//
//  Created by 陳峻琦 on 23/2/2022.
//

import Foundation
import SwiftUI

struct ToastViewModifier: ViewModifier {
    @Binding var present: Bool
    @Binding var message: String // 显示的文字
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .zIndex(0)
            
            //Toast内容
            VStack {
                Text(message)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.7))
                    .cornerRadius(5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray.opacity(0.1))
            .opacity(present ? 1 : 0)
            .zIndex(1)
            .onChange(of: present) { value in
                if value {
                    //延迟三秒消失
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        present.toggle()
                    }
                }
            }
        }
    }
}


extension View {
    func toast(present: Binding<Bool>, message: Binding<String>) -> some View {
        self.modifier(ToastViewModifier(present: present, message: message))
    }
}
