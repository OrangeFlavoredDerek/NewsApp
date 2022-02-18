//
//  BottomSheetViewModifier.swift
//  NewsApp
//
//  Created by 陳峻琦 on 18/2/2022.
//

import Foundation
import SwiftUI

struct BottomSheetViewModifier<ViewContent: View>: ViewModifier {
    let title: Text?
    let messageContent: ViewContent
    @Binding var isPresent: Bool
    
    init(isPresent: Binding<Bool>, title: Text?, @ViewBuilder content: () -> ViewContent) {
        self.title = title
        self.messageContent = content()
        self._isPresent = isPresent
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            ZStack {
                VStack {
                    if title != nil {
                        title
                            .padding(.top, 16)
                        Divider()
                    }
                    messageContent
                }
                .offset(y: isPresent ? 0 : 130)
                .frame(maxWidth: .infinity)
                .background(.white)
                .onTapGesture {
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .background(.gray.opacity(0.1))
            .opacity(isPresent ? 1 : 0)
            .animation(.easeInOut(duration: 0.3), value: isPresent)
            .onTapGesture {
                isPresent.toggle()
            }
        }
    }
}

extension View{
    func bottomSheet<Content>(isPresent:Binding<Bool>,title:Text?, @ViewBuilder content:() -> Content) -> some View where Content : View {
        self.modifier(BottomSheetViewModifier(isPresent: isPresent, title: title, content: content))
    }
}
