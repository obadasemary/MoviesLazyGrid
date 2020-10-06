//
//  MovieListView.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 6.10.2020.
//

import SwiftUI

struct MovieListView: View {
    
    // MARK: - PROPERTIES
    
    let movies: [MovieViewModel]
    
    // MARK: - BODY
    
    var body: some View {
        List(self.movies, id: \.imdbId) { movie in
            
            MovieCellView(movie: movie)
        }
    }
}

// MARK: - PREVIEW

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(
            movies: [
                MovieViewModel.init(
                    movie:
                        Movie(
                            title: "Captain Marvel",
                            year: "2020",
                            imdbID: "tt4154664",
                            type: "movie",
                            poster: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ1bDkDLq-_bteASakhnC1XYwlkErFuqcof7KMhFpRwVhCTh1Vo"
                        )
                ),
                MovieViewModel.init(
                    movie:
                        Movie(
                            title: "Avengers: Endgame",
                            year: "2019",
                            imdbID: "tt4154796",
                            type: "movie",
                            poster: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQA_-tL18_rj9zEcjN6n41NEaJm-kRNF9UeOtvksZ4z_OW6jRA9"
                        )
                ),
                MovieViewModel.init(
                    movie:
                        Movie(
                            title: "Guardians of the Galaxy Vol. 2",
                            year: "2017",
                            imdbID: "tt3896198",
                            type: "movie",
                            poster: "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg"
                        )
                )
            ]
        )
    }
}
