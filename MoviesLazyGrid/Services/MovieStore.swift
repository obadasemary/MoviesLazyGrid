//
//  MovieStore.swift
//  MoviesLazyGrid
//
//  Created by Abdelrahman Mohamed on 28.09.2020.
//

import Foundation

class MovieStore: ObservableObject {
    
    var path = "http://www.omdbapi.com/?s="
    var search = ""
    var apiKeyString = "&apikey="
    var apikey = "a22cefd9"
    var fullPath: String
    
    
    init(search: String) {
        
        fullPath = path + search + apiKeyString + apikey
    }
    
    @Published var movies: [Movie]? = [Movie]()
    
    func getAll() {
        
        guard let url = URL(string: fullPath) else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                return
            }
            
            let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
            if let movieResponse = movieResponse {
                DispatchQueue.main.async {
                    self.movies = movieResponse.movies
                }
            }
        }.resume()
    }
    
}
