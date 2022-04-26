//
//  SwiperControl.swift
//  NewsApp
//
//  Created by 陳峻琦 on 6/2/2022.
//

import SwiftUI

struct SwiperController:UIViewRepresentable {
    var numOfPages:Int
    // 轮播控制器当前页
    @Binding var currentPage:Int
    
    // 创建协调器
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // 创建controller
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numOfPages
        control.addTarget(context.coordinator, action: #selector(context.coordinator.onChanged(sender:)), for: .valueChanged)
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    typealias UIViewType = UIPageControl
    
    class Coordinator: NSObject {
        var parent:SwiperController
        
        init(_ parent:SwiperController) {
            self.parent = parent
        }
        
        @objc func onChanged(sender:UIPageControl){
            parent.currentPage = sender.currentPage
        }
    }
    
}

