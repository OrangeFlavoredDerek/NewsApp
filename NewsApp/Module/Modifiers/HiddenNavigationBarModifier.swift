//
//  HiddenNavigationBarModifier.swift
//  NewsApp
//
//  Created by 陳峻琦 on 17/2/2022.
//

import Foundation
import SwiftUI

// How to remove the default Navigation Bar space in SwiftUI NavigationView ?
// https://stackoverflow.com/questions/57517803/how-to-remove-the-default-navigation-bar-space-in-swiftui-navigationview

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier(HiddenNavigationBar())
    }
}
