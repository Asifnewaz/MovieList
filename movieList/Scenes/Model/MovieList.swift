//
//  MovieList.swift
//  movieList
//
//  Created by USER on 5/30/22.
//

import Foundation

struct MovieList: Codable {
    var page: Int?
    var results: [Results]?
}

struct Results: Codable {
    var title: String?
    var overview: String?
    var poster_path: String?
    
    
}
