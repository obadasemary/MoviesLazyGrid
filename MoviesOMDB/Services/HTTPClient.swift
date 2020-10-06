//
//  HTTPClient.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 28.09.2020.
//

import Foundation

class HTTPClient: ObservableObject {
    
    var path = "http://www.omdbapi.com/?s="
    var search = ""
    var apiKeyString = "&apikey="
//    var apikey = "a22cefd9"
    var fullPath: String
    
    // MARK: - INIT
    
    init(search: String) {
        
        fullPath = path + search + apiKeyString + Constants.API_KEY
    }
    
    @Published var movies: [Movie]? = [Movie]()
    
    // MARK: - Get All
    
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
    
    // MARK: - Get Movies By Movie Name
    
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?, NetwrokError>) -> Void) {
        
        fullPath = path + search + apiKeyString + Constants.API_KEY
        
        guard let url = URL(string: fullPath) else {
           
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                
                return completion(.failure(.noData))
            }
            
            guard let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                
                return completion(.failure(.decodingError))
            }
            
            completion(.success(movieResponse.movies))
            
        }.resume()
    }
}
