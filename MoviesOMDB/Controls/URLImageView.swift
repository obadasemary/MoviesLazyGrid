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
        URLImageView(url: "https://images.unsplash.com/photo-1566470708857-4976489d9f41?ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80")
    }
}
