//
//  Movie.swift
//  MoviesLazyGrid
//
//  Created by Abdelrahman Mohamed on 27.09.2020.
//

import Foundation

struct Movie: Decodable {
    
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        
        case title = "Title"
        case poster = "Poster"
        case year = "Year"
        case type = "Type"
        case imdbID = "imdbID"
    }
}

//struct Movie: Decodable {
//    
//    let imdbID: String
//    let title: String
//    let year: String
//    let poster: String
//    let type: String
//    
//    private enum CodingKeys: String, CodingKey {
//        
//        case imdbID
//        case title = "Title"
//        case poster = "Poster"
//        case year = "Year"
//        case type = "Type"
//    }
//}
