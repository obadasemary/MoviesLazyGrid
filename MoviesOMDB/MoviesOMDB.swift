//
//  MoviesOMDB.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 27.09.2020.
//

import SwiftUI

@main
struct MoviesOMDB: App {
    
    @StateObject var store = MovieStore(search: "Batman")
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
