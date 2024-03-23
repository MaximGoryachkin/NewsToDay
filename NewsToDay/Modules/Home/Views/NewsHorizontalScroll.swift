//
//  NewsHorizontalScroll.swift
//  NewsToDay
//
//  Created by Юрий on 22.03.2024.
//

import SwiftUI

struct NewsHorizontalScroll: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(0..<10, id: \.self) { index in
                    NewsSingleView(category: "POLITICS", title: "The latest situation in the presidential election", image: "NewsImage")
                }
            }
        }
    }
}

#Preview {
    NewsHorizontalScroll()
}
