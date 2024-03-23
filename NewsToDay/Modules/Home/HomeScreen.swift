//
//  HomeScreen.swift
//  NewsToDay
//
//  Created by Юрий on 21.03.2024.
//

import SwiftUI

struct HomeScreen: View {
    @State private var searchText = ""
    
    
    var body: some View {
        NavigationView  {
            ScrollView {
                VStack(spacing: 16){
                    Text("Discover things of this word")
                        .padding(.top, 40)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    TextField("Search", text: $searchText)
                        .padding()
                        .background(Color.grayLighter)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                    
                    
                    CategoriesHorizontalScroll()
                    
                    NewsHorizontalScroll()
                        .padding()
                    
                    HStack {
                        Text("Recommended for you")
                            .font(Font.interSemiBold20)
                            .padding()
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("See All")
                                .foregroundColor(Color.graykDark)
                        }
                        .padding()
                    }
                    
                    NewsVerticalScroll()
                }
            }
        }
    }
}

#Preview {
    HomeScreen()
}
