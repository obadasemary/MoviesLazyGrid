//
//  ViewModelBase.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 6.10.2020.
//

import Foundation

enum LoadaingState {
    case loading, success, failed, none
}

class ViewModelBase: ObservableObject {
    
    @Published var loadingState: LoadaingState = .none
}
