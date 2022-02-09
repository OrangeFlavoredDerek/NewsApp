//
//  MeasureSizeModifier.swift
//  NewsApp
//
//  Created by 陳峻琦 on 8/2/2022.
//

import Foundation
import SwiftUI

struct MeasureSizeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(GeometryReader (content: { reader in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: reader.size)
            }))
    }
}

extension View {
    func measureSize(perform action: @escaping (CGSize) -> Void) -> some View {
        self.modifier(MeasureSizeModifier())
            .onPreferenceChange(SizePreferenceKey.self, perform: action)
    }
}
