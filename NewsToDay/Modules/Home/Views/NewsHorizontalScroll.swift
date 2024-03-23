//
//  NewsHorizontalScroll.swift
//  NewsToDay
//
//  Created by Юрий on 22.03.2024.
//

import SwiftUI

private let rows = [GridItem()]

struct NewsHorizontalScroll: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(0..<10) {_ in
                    NewsSingleView(category: "POLITICS", title: "The latest situation in the presidential election", image: "NewsImage")
                }
            }
        }
    }
}

#Preview {
    NewsHorizontalScroll()
}
