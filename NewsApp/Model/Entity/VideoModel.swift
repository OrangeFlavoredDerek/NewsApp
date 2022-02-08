//
//  VideoModel.swift
//  NewsApp
//
//  Created by 陳峻琦 on 6/2/2022.
//

import Foundation

struct VideoModel: Codable, Identifiable {
    var id: String
    var title: String
    var duration: String
    var imgURL: String
}
