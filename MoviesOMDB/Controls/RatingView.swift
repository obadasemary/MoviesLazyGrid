//
//  RatingView.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 6.10.2020.
//

import SwiftUI

struct RatingView: View {
    
    // MARK: - PROPERTIES
    
    @Binding var rating: Int?
    
    private func starType(index: Int) -> String {
        
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    // MARK: - BODY
    
    var body: some View {
        HStack {
            ForEach(1...10, id: \.self) { index in
                Image(systemName: self.starType(index: index))
                    .foregroundColor(.orange)
                    .onTapGesture(count: 1, perform: {
                        self.rating = index
                    })
            }
        }
    }
}

// MARK: - PREVIEW

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(7))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
