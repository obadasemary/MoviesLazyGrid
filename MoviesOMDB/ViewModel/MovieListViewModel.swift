//
//  MovieListViewModel.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 6.10.2020.
//

import Foundation

class MovieListViewModel: ViewModelBase {
    
    @Published var moviesVM = [MovieViewModel]()
    let httpClient = HTTPClient()
    
    /// search By Name
    /// - Parameter name: movie name
    func searchByName(_ name: String) {
        
        if name.isEmpty {
            return
        }
        
        self.loadingState = .loading
        
        httpClient.getMoviesBy(search: name.trimmedAndEscaped()) { result in
            
            switch result {
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.moviesVM = movies.map(MovieViewModel.init)
                        self.loadingState = .success
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
}
