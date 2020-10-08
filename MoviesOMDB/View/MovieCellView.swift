//
//  MovieCellView.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 6.10.2020.
//

import SwiftUI

struct MovieCellView: View {
    
    // MARK: - PROPERTIES
    
    let movie: MovieViewModel
    
    // MARK: - BODY
    
    var body: some View {
        
        HStack(alignment: .top) {
            
            URLImageView(url: movie.poster)
                .frame(width: 100, height: 120)
                .cornerRadius(6)
            
            VStack(alignment: .leading) {
                
                Text(movie.title)
                    .font(.headline)
                
                Text(movie.year)
                    .opacity(0.5)
                    .padding(.top, 10)
            }
            .padding(5)
            Spacer()
        }
        .contentShape(Rectangle())
    }
}

struct MovieCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCellView(
            movie:
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
        )
    }
}
