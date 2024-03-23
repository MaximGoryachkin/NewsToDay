//
//  CategoriesHorizontalScroll.swift
//  NewsToDay
//
//  Created by Юрий on 23.03.2024.
//

import SwiftUI

struct CategoriesHorizontalScroll: View {
    @State private var selectedCategory = "Random"
    
    let categories = ["Random", "Sports", "Gaming", "Politics"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(categories, id: \.self) { item in
                    Text(item)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .font(.interSemiBold16)
                        .foregroundColor(selectedCategory == item ? Color.white : Color.grayPrimary)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(selectedCategory == item ? Color.purplePrimary : Color.grayLighter)
                        )
                        .onTapGesture {
                            selectedCategory = item
                        }
                }
            }
            
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    CategoriesHorizontalScroll()
}
