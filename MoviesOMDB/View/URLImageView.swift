//
//  URLImageView.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 28.09.2020.
//

import SwiftUI

struct URLImageView: View {
    
    // MARK: - PROPERTIES
    
    let url: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String) {
        
        self.url = url
        self.imageLoader.downloadImage(url: self.url)
    }
    
    // MARK: - BODY
    
    var body: some View {
        
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!)
                .renderingMode(.original)
                .resizable()
                .cornerRadius(20)
        } else {
            return Image(systemName: "photo.on.rectangle.angled")
                .renderingMode(.original)
                .resizable()
                .cornerRadius(20)
        }
    }
}

struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(url: "https://m.media-amazon.com/images/M/MV5BOTM3MTRkZjQtYjBkMy00YWE1LTkxOTQtNDQyNGY0YjYzNzAzXkEyXkFqcGdeQXVyOTgwMzk1MTA@._V1_SX300.jpg")
    }
}
