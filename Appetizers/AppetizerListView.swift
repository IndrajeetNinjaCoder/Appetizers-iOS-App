//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by test on 10/12/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @State private var appetizers = [Appetizers]()
    @State private var isShowingDetail = false
    @State private var selectedAppetizer: Appetizers?
    
    var body: some View {
        ZStack{
            
            NavigationView{
                List(appetizers, id: \.id){ appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            selectedAppetizer = appetizer
                            isShowingDetail = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .disabled(isShowingDetail)
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            
            if(isShowingDetail){
                AppetizerDetailView(appetizer: selectedAppetizer!,isShowingDetail: $isShowingDetail)
            }
        
            
        }
        .task {
            await fetchData()
        }
    }
    


    func fetchData() async {
          let url1 = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
          
          // Create URL
          guard let url = URL(string: url1) else {
              print("Invalid URL")
              return
          }
          
          // Fetch data from URL
          do {
              let (data, _) = try await URLSession.shared.data(from: url)
              
              // Decode data
              if let decodedResponse = try? JSONDecoder().decode(AppetizerResponse.self, from: data) {
                  appetizers = decodedResponse.request
              }
          } catch {
              print("Failed to fetch data: \(error.localizedDescription)")
          }
      }
  }



#Preview {
    AppetizerListView()
}


struct Appetizers: Codable{
    var id: Int
    var name: String
    var description: String
    var carbs: Int
    var imageURL: String
    var protein: Int
    var calories: Int
    var price: Double
}


struct AppetizerResponse: Codable {
    var request: [Appetizers]
}
