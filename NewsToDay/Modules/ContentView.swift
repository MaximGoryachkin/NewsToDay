//
//  ContentView.swift
//  NewsToDay
//
//  Created by Victor on 23.03.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var router = RouterService()
    
    
    var body: some View {
        Group {
            switch router.screen {
            case .onbording:
                OnboardingView(router: router)
            case .authorization:
                AuthorizeView(router: router)
            case .main:
                TabBar(router: router)
            case .favoriteTopics:
                CategoriesView(flow: .onbording, router: router)
            }
        }
        .animation(.smooth, value: router.screen)
    }
}
