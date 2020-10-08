//
//  URL+Extensions.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 6.10.2020.
//

import Foundation

extension URL {
    
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: Constants.pathS + name + Constants.apiKeyString + Constants.API_KEY)
    }
    
    static func forMovieByImdbId(_ imdbId: String) -> URL? {
        return URL(string: Constants.pathI + imdbId + Constants.apiKeyString + Constants.API_KEY)
    }
}
