//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by test on 10/12/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    var appetizer: Appetizers
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 225)
            } placeholder: {
                ProgressView() // Placeholder while the image is loading
                    .frame(width: 300, height: 225)
                    .background(Color.gray.opacity(0.3))
            }
            
            
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()
            
            HStack(spacing: 40){
                
                VStack(spacing: 5){
                    Text("Calories")
                        .font(.caption)
                        .bold()
                    Text("\(appetizer.calories)")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
                
                VStack(spacing: 5){
                    Text("Carbs")
                        .font(.caption)
                        .bold()
                    Text("\(appetizer.carbs) g")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
                
                VStack(spacing: 5){
                    Text("Protein")
                        .font(.caption)
                        .bold()
                    Text("\(appetizer.protein) g")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
            }
            
            Spacer()
            
            Button{
                
            }label: {
                Text("$\(appetizer.price, specifier: "%0.2f") - Add To Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 250, height: 50)
                    .background(Color("brandPrimary"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
            }
            .padding(.bottom, 30)
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        }label: {
            ZStack {
                
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.black)
                
            }
            
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: Appetizers(
        id: 1,
        name: "Asian Flank Steak",
        description: "This perfectly thin cut just melts in your mouth.",
        carbs: 0,
        imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
        protein: 14,
        calories: 300,
        price: 8.99
    ), isShowingDetail: .constant(true))
}
