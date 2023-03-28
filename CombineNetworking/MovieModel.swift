//
//  MovieModel.swift
//  CombineNetworking
//
//  Created by ASMI iOS Dev on 25/03/23.
//

import Foundation

struct MovieResponse: Codable {
    let movies: [Movie]

//    enum CodingKeys: String, CodingKey {
//        case movies = "results"
//    }
}


struct Movie: Codable, Identifiable {
    var id = UUID()
    let movieId: Int
    let originalTitle: String
    let title: String

//    enum CodingKeys: String, CodingKey {
//        case movieId = "id"
//        case originalTitle = "original_title"
//        case title
//    }
}
