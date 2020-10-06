//
//  NetwrokError.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 6.10.2020.
//

import Foundation

enum NetwrokError: Error {
    
    case badURL
    case noData
    case decodingError
}
