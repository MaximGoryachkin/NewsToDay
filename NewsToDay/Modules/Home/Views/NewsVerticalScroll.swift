//
//  NewsVerticalScroll.swift
//  NewsToDay
//
//  Created by Юрий on 23.03.2024.
//

import SwiftUI

struct NewsVerticalScroll: View {
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack{
                ForEach(0..<10) {_ in
                    NewsSingleViewForVerticalScroll(category: "Design", title: "A Simple Trick For Creating", image: "NewsImage")
                }
            }
        }
    }
}

#Preview {
    NewsVerticalScroll()
}
