//
//  MovieListScreen.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 6.10.2020.
//

import SwiftUI

struct MovieListScreen: View {
    
    // MARK: - PROPERTIES
    
    @ObservedObject private var movieListVM: MovieListViewModel
    
    init() {
        self.movieListVM = MovieListViewModel()
        self.movieListVM.searchByName("batman")
    }
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            MovieListView(movies: self.movieListVM.moviesVM)
                .listStyle(InsetGroupedListStyle())
                .navigationBarTitle("Movies")
        }
        .embadNavigationView()
    }
}

// MARK: - PREVIEW

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
