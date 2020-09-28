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
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: MovieStore(search: "Batman"))
    }
}
