//
//  FailedView.swift
//  MoviesOMDB
//
//  Created by Abdelrahman Mohamed on 6.10.2020.
//

import SwiftUI

struct FailedView: View {
    
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            
            Spacer()
            
            HStack {
                
                Image(systemName: "play.slash.fill")
                
                Image(systemName: "exclamationmark.icloud.fill")
                   
                Image(systemName: "bolt.slash.fill")
            }
            .padding()
            .font(.system(size: 50))
            .foregroundColor(.pink)
                
            Spacer()
            
            Text("Oops Something's wrong happened")
                .font(.title3)
                .fontWeight(.heavy)
                .foregroundColor(.pink)
        }
    }
}

// MARK: - PREVIEW

struct FailedView_Previews: PreviewProvider {
    static var previews: some View {
        FailedView()
    }
}
