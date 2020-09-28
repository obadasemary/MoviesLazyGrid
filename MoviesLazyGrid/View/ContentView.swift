//
//  ContentView.swift
//  MoviesLazyGrid
//
//  Created by Abdelrahman Mohamed on 27.09.2020.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    @ObservedObject var store: MovieStore
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    
                    ForEach(store.movies ?? [Movie](), id: \.imdbID) { movie in
                        
                        NavigationLink(destination: MovieDetailsView(movie: movie)) {
                        
                            VStack {
                                
                                URLImageView(url: movie.poster)
                                    .frame(width: 100, height: 200)
                                Text(movie.title)
                                    .frame(maxHeight: .infinity, alignment: .top)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Movies")
        }
        .onAppear {
            store.getAll()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: MovieStore(search: "Batman"))
    }
}
