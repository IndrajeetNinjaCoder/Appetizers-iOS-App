//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by test on 10/12/24.
//

import SwiftUI

struct AppetizerListCell: View {
    var appetizer: Appetizers
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView() // Placeholder while the image is loading
                    .frame(width: 120, height: 90)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }
            
            
            VStack(alignment: .leading){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: Appetizers(
                id: 1,
                name: "Asian Flank Steak",
                description: "This perfectly thin cut just melts in your mouth.",
                carbs: 0,
                imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
                protein: 14,
                calories: 300,
                price: 8.99
    ))
}


