//
//  NewsSingleView.swift
//  NewsToDay
//
//  Created by Юрий on 22.03.2024.
//

import SwiftUI

struct NewsSingleView: View {
    
    var category: String
    var title: String
    var image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 250, height: 250)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.black.opacity(0.4))
            )
            .overlay(
                Button {
                    print("Button tapped")
                } label: {
                    Image(systemName: "bookmark")
                        .foregroundColor(.white)
                        .font(.title2)
                }
                    .offset(y: -85)
                    .padding(), alignment: .trailing
            )
            .overlay(
                Button {
                    
                } label: {
                    VStack {
                        Text(category)
                            .fontWeight(.thin)
                            .foregroundColor(.white)
                            .font(.interMedium16)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 7)
                        
                        Text(title)
                            .foregroundColor(.white)
                            .font(.interBold16)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                        
                    }
                    .padding()
                }, alignment: .bottomLeading
                )
    }
}

#Preview {
    NewsSingleView(category: "POLITICS", title: "The latest situation in the presidential election", image: "NewsImage")
}
