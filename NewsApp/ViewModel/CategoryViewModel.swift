//
//  CategoryViewModel.swift
//  NewsApp
//
//  Created by 陳峻琦 on 10/2/2022.
//

import Foundation

class CategoryViewModel: ObservableObject {
    @Published private(set) var categories: [Category] = []
    private var service = CategoryService()
    
    init() {
        list()
    }
    
    private func list() {
        service.list { (data: [Category]?, msg, code) in
            guard let result = data else { return }
            self.categories = result
        }
    }
}
