//
//  Rating.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 7.10.2020.
//

import Foundation

struct Rating: Codable {
    let source, value: String

    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}
