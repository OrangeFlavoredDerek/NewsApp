//
//  WebView.swift
//  NewsApp
//
//  Created by 陳峻琦 on 17/2/2022.
//

import Foundation
import UIKit
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var htmlString: String
    var baseURL: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlString, baseURL: baseURL)
    }
    
    
    
    typealias UIViewType = WKWebView
    
    
}
