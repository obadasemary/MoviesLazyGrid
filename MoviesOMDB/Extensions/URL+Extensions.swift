//
//  URL+Extensions.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 6.10.2020.
//

import Foundation

extension URL {
    
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: Constants.path + name + Constants.apiKeyString + Constants.API_KEY)
    }
}
