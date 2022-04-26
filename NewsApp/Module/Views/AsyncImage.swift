//
//  AsyncImage.swift
//  NewsApp
//
//  Created by 陳峻琦 on 8/2/2022.
//

import SwiftUI
import Combine

struct AsyncImage<PlaceHolder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeHolder: PlaceHolder
    //private var url: URL?
    
    init(_ url: String, @ViewBuilder placeHolder: ()-> PlaceHolder) {
        self.placeHolder = placeHolder()
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
        //self.url = URL(string: url) ?? nil
    }
    
    var body: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
                    .scaledToFit()
            } else {
                placeHolder
            }
        }
        .onAppear(perform: loader.load)
    }
}

//网络图片加载器
class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    private let url: String
    private var cancelable: AnyCancellable?
    
    init(url: String) {
        self.url = url
    }
    
    //加载图片
    func load() {
        guard let url = URL(string: url) else { return }
        
        cancelable = URLSession.shared.dataTaskPublisher(for: url)
            .map{ UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                self?.image = $0
            })
    }
    
    deinit {
        cancelable?.cancel()
    }
}
