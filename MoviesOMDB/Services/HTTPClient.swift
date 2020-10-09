//
//  HTTPClient.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 28.09.2020.
//

import Foundation

class HTTPClient: ObservableObject {
    
    var fullPath: String?
    
    // MARK: - INIT
    
    init() {}
    
    init(search: String) {
        
        fullPath = Constants.pathS + search + Constants.apiKeyString + Constants.API_KEY
    }
    
    @Published var movies: [Movie]? = [Movie]()
    
    // MARK: - Get All
    
    /// Get All
    @available(*, deprecated, message: "use get Movies by instead of this func", renamed: "getMoviesBy")
    func getAll() {
        
        guard let url = URL(string: fullPath ?? "") else {
            
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
    
    /// Get Movies By Movie Name
    /// - Parameters:
    ///   - search: movie name
    ///   - completion: completion description
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?, NetwrokError>) -> Void) {
        
        guard let url = URL.forMoviesByName(search) else {
           
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
    
    // MARK: - Get Movie Details By Movie imdbId
    
    /// Get Movie Details By Movie imdbId
    /// - Parameters:
    ///   - imdbId: imdbId
    ///   - completion: completion description
    func getMovieDetailsBy(imdbId: String, completion: @escaping (Result<MovieDetail, NetwrokError>) -> Void) {
        
        guard let url = URL.forMovieByImdbId(imdbId) else {
           
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                
                return completion(.failure(.noData))
            }
            
            guard let movieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                
                return completion(.failure(.decodingError))
            }
            
            completion(.success(movieDetail))
            
        }.resume()
    }
}
