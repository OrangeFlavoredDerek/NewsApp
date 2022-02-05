//
//  AppBarView.swift
//  NewsApp
//
//  Created by 陳峻琦 on 5/2/2022.
//

import Foundation
import SwiftUI

//AppBar Modifier
struct AppBarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding(.bottom, 8)
            .padding(.horizontal, 4)
            .background(LinearGradient(gradient: Gradient(
                colors: [Color(red: 20/255,green: 158/255, blue: 231/255), Color(red: 45/255, green: 205/255, blue: 245/255)]),
                startPoint: .leading,
                endPoint: .trailing)
            )
    }
}

extension View {
    func AppBarStyle() -> some View {
        self.modifier(AppBarModifier())
    }
}
