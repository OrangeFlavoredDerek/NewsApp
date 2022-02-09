//
//  TaskPageStyle.swift
//  NewsApp
//
//  Created by 陳峻琦 on 9/2/2022.
//

import Foundation
import SwiftUI

struct LineChartModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.horizontal, .bottom])
            .background(.white)
    }
}

extension View {
    func lineChartStyle() -> some View {
        self.modifier(LineChartModifier())
    }
}
