//
//  Typealias.swift
//  NewsApp
//
//  Created by 陳峻琦 on 10/2/2022.
//

import Foundation

typealias ListCompletion<T: Codable> = ([T]?, String, Int) -> ()

typealias DataCompletion<T: Codable> = (T?, String, Int) -> ()
