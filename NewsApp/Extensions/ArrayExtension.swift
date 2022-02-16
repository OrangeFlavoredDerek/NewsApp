//
//  ArrayExtension.swift
//  NewsApp
//
//  Created by 陳峻琦 on 16/2/2022.
//

import Foundation

extension Array {
    public init(generating elementGenerator: (Int) -> Element, count: Int) {
        self = (0..<count).map(elementGenerator)
    }
}
