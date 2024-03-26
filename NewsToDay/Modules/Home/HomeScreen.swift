//
//  HomeScreen.swift
//  NewsToDay
//
//  Created by Юрий on 21.03.2024.
//

import SwiftUI
import NewsNetworkManager

struct HomeScreen: View {
    @State private var searchText = ""
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16){
                    Text("Discover things of this word")
                        .font(Font.interRegular16)
                        .foregroundStyle(Color.grayPrimary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .font(.title3)
                            .foregroundColor(Color.grayPrimary)
                            .padding()
                        
                        TextField("", text: $searchText)
                            .font(.title3)
                            .foregroundColor(.gray)
                            .background(Color.grayLighter)
                    }
                    .background(Color.grayLighter)
                    .cornerRadius(10)
                    .padding()
                    
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
                                .foregroundColor(Color.grayDarker)
                        }
                        .padding()
                    }
                    
                    NewsVerticalScroll()
                }
            }
            .navigationTitle("Browse")
        }
    }
}

#Preview {
    HomeScreen()
}
