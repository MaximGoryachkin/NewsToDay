//
//  TabBar.swift
//  NewsToDay
//
//  Created by Юрий on 20.03.2024.
//

import SwiftUI

struct TabBar: View {
    @State private var selectedView = 0
    private var router: RouterService
    
    init(router: RouterService) {
        self.router = router
    }
    
    var body: some View {
            TabView(selection: $selectedView) {
                HomeScreen()
                    .tabItem {
                        Image(selectedView == 0 ? "icon.home.hl" : "icon.home")
                    }
                    .tag(0)
                
                CategoriesView(flow: .main, router: router)
                    .tabItem {
                        Image(selectedView == 1 ? "icon.categories.hl" : "icon.categories")
                    }
                    .tag(1)
                
                BookmarkView()
                    .tabItem {
                        Image(selectedView == 2 ? "icon.bookmark.hl" : "icon.bookmark")
                    }
                    .tag(2)
                
                PersonalAccountView(router: router)
                    .tabItem {
                        Image(selectedView == 3 ? "icon.profile.hl" : "icon.profile")
                    }
                    .tag(3)
            }
    }
}

#Preview {
    TabBar(router: RouterService())
}

