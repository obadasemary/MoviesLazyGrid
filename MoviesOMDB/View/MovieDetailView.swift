//
//  MovieDetailView.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 7.10.2020.
//

import SwiftUI

struct MovieDetailView: View {
    
    // MARK: - PROPERTIES
    
    let movieDetailVM: MovieDetailViewModel
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 10) {
                
                URLImageView(url: movieDetailVM.poster)
                    .cornerRadius(10)
                
                Text(movieDetailVM.title)
                    .font(.title)
                
                Text(movieDetailVM.plot)
                Text("Director")
                    .fontWeight(.bold)
                Text(movieDetailVM.director)
                HStack {
                    RatingView(rating: .constant(movieDetailVM.rating))
                    Text("\(movieDetailVM.rating)/10")
                }
                .padding()
                
                Spacer()
            }
            .padding()
            .navigationBarTitle(self.movieDetailVM.title)
        }
    }
}

// MARK: - PREVIEW

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(
            movieDetailVM:
                MovieDetailViewModel.init(
                    movieDetail:
                        MovieDetail?.init(
                            MovieDetail(
                                title: "Avengers: Endgame",
                                year: "2019",
                                rated: "PG-13",
                                released: "26 Apr 2019",
                                runtime: "181 min",
                                genre: "Action, Adventure, Drama, Sci-Fi",
                                director: "Anthony Russo, Joe Russo",
                                writer: "Christopher Markus (screenplay by), Stephen McFeely (screenplay by), Stan Lee (based on the Marvel comics by), Jack Kirby (based on the Marvel comics by), Joe Simon (Captain America created by), Jack Kirby (Captain America created by), Steve Englehart (Star-Lord created by), Steve Gan (Star-Lord created by), Bill Mantlo (Rocket Raccoon created by), Keith Giffen (Rocket Raccoon created by), Jim Starlin (Thanos,  Gamora & Drax created by), Stan Lee (Groot created by), Larry Lieber (Groot created by), Jack Kirby (Groot created by), Steve Englehart (Mantis created by), Don Heck (Mantis created by)",
                                actors: "Robert Downey Jr., Chris Evans, Mark Ruffalo, Chris Hemsworth",
                                plot: "After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos' actions and restore balance to the universe.",
                                language: "English, Japanese, Xhosa, German",
                                country: "USA",
                                awards: "Nominated for 1 Oscar. Another 65 wins & 103 nominations.",
                                poster: "https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg",
                                ratings: [
                                    Rating(source: "Internet Movie Database", value: "8.4/10"),
                                    Rating(source: "Rotten Tomatoes", value: "94%"),
                                    Rating(source: "Metacritic", value: "78/100")
                                ],
                                metascore: "78",
                                imdbRating: "8.4",
                                imdbVotes: "762,149",
                                imdbID: "tt4154796",
                                type: "movie",
                                dvd: "N/A",
                                boxOffice: "N/A",
                                production: "Marvel Studios, Walt Disney Pictures",
                                website: "N/A",
                                response: "True"
                            )
                        )
                )
        )
        .embadNavigationView()
    }
}
