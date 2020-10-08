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
    @State private var movieName: String = ""
    
    init() {
        self.movieListVM = MovieListViewModel()
    }
    
    // MARK: - BODY
    
    var body: some View {
        
        VStack {
            
            TextField("Search", text: $movieName) { _ in
                
            } onCommit: {
                self.movieListVM.searchByName(self.movieName)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
                
                .navigationBarTitle("Movies")
            
            if self.movieListVM.loadingState == .success {
                MovieListView(movies: self.movieListVM.moviesVM)
                    .listStyle(InsetGroupedListStyle())
            } else if self.movieListVM.loadingState == .failed {
                FailedView()
            } else if self.movieListVM.loadingState == .loading {
                LoadingView()
                
                Spacer()
            }
            
        }
        .padding()
        .embadNavigationView()
    }
}

// MARK: - PREVIEW

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
