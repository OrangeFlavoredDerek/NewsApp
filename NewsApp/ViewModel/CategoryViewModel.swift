//
//  CategoryViewModel.swift
//  NewsApp
//
//  Created by 陳峻琦 on 10/2/2022.
//

import Foundation

class CategoryViewModel: ObservableObject {
    //分类数据
    @Published private(set) var categories: [Category] = Array(repeating: .mock, count: 4)
    //分类数据是否加载完成
    @Published private(set) var loaded: Bool = false
    //类型数据
    @Published private(set) var types = ["相关资讯", "视频课程"]
    private var service = CategoryService()
    
    init() {
        list()
    }
    
    private func list() {
        service.list { (data: [Category]?, msg, code) in
            guard let result = data else { return }
            self.categories = result
            self.loaded = true
        }
    }
}
