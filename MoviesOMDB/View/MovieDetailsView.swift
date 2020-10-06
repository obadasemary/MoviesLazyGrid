//
//  MovieDetailsView.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 28.09.2020.
//

import SwiftUI

struct MovieDetailsView: View {
    
    // MARK: - PROPERTIES
    
    @State var movie: Movie
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    URLImageView(url: movie.poster)
                        .padding()
                    
                    Text(movie.title)
                        .font(.largeTitle)
                        .padding()
                    
                    Spacer()
                }
            }
            .navigationBarTitle(movie.title, displayMode: .inline)
        }
    }
}

// MARK: - PREVIEW

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(
            movie:
                Movie(
                    title: "Guardians of the Galaxy Vol. 2",
                    year: "2017",
                    imdbID: "tt3896198",
                    type: "movie",
                    poster: "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg"
                )
        )
    }
}
