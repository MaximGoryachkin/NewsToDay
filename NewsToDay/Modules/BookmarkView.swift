//
//  BookmarkView.swift
//  NewsToDay
//
//  Created by Юрий on 25.03.2024.
//

import SwiftUI

struct BookmarkView: View {
    var bookmarksNews: [NewsSingleViewForVerticalScroll] = [
        NewsSingleViewForVerticalScroll(category: "Design", title: "A Simple Trick For Creating", image: "NewsImage"),
        NewsSingleViewForVerticalScroll(category: "Art", title: "Six steps to creating a color palette", image: "NewsImage"),
        NewsSingleViewForVerticalScroll(category: "Colors", title: "Creating Color Palette from world around you", image: "NewsImage"),
        NewsSingleViewForVerticalScroll(category: "Design", title: "A Simple Trick For Creating Color Palettes Quicly", image: "NewsImage")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Bookmarks")
                    .font(.interSemiBold24)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Text("Saved articles to the library")
                    .font(.interRegular16)
                    .foregroundColor(.grayPrimary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.init(top: .zero, leading: 16, bottom: 16, trailing: .zero))
                
                if bookmarksNews.isEmpty {
                    
                    VStack {
                        ZStack {
                            Circle()
                                .fill(Color.grayLighter)
                                .frame(width: 72, height: 72)
                            
                            Image("book-alt")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            
                        }
                        
                        Text("You haven't saved any articles \n yet. Start reading and \n bookmaring them now.")
                            .font(Font.interMedium16)
                            .multilineTextAlignment(.center)
                            .padding()
                        Spacer()
                    }
                    .padding(.vertical, 150)
                } else {ScrollView(.vertical) {
                        LazyVStack{
                            ForEach(bookmarksNews, id: \.title) {item in
                                item
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    BookmarkView()
}
