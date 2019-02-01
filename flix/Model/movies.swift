//
//  movies.swift
//  flix
//
//  Created by Neil Shah on 1/29/19.
//  Copyright © 2019 Neil Shah. All rights reserved.
//

import Foundation

class MovieData: Codable {
    var title: String
    var overview: String
    var poster_path: String?
    var backdrop_path: String?
    var release_date: String?
}

class Envelope: Codable {
    var results: [MovieData]?
//    var page: Int?
//    var total_results: Int?
//    var total_pages: Int?
}
