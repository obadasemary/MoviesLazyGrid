//
//  MovieViewModel.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 6.10.2020.
//

import Foundation

struct MovieViewModel {
    
    let movie: Movie
    
    var imdbId: String {
        movie.imdbID
    }
    
    var title: String {
        movie.title
    }
    
    var type: String {
        movie.type
    }
    
    var poster: String {
        movie.poster
    }
    
    var year: String {
        movie.year
    }
}
