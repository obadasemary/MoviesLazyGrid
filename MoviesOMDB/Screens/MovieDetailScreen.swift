//
//  MovieDetailScreen.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 7.10.2020.
//

import SwiftUI

struct MovieDetailScreen: View {
    
    // MARK: - PROPERTIES
    
    let imdbId: String
    @ObservedObject var movieDetailVM = MovieDetailViewModel()
    
    // MARK: - BODY
    
    var body: some View {
        
        VStack {
            
            if self.movieDetailVM.loadingState == .success {
                MovieDetailView(movieDetailVM: movieDetailVM)
            } else if self.movieDetailVM.loadingState == .failed {
                FailedView()
            } else if self.movieDetailVM.loadingState == .loading {
                Spacer()
                LoadingView()
                Spacer()
            }
        }
        
        .onAppear {
            self.movieDetailVM.getDetailsByImdbId(imdbId: self.imdbId)
        }
        
    }
}

// MARK: - PREVIEW

struct MovieDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailScreen(imdbId: "tt4154796")
    }
}
