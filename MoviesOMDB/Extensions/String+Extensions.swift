//
//  String+Extensions.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 6.10.2020.
//

import Foundation

extension String {
    
    func trimmedAndEscaped() -> String {
        
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)        
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
