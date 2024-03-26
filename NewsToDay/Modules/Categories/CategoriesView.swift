//
//  CategoriesView.swift
//  NewsToDay
//
//  Created by Victor on 24.03.2024.
//

import SwiftUI
import NewsNetworkManager

struct CategoriesView: View {
    
    enum Flow {
        case main
        case onbording
    }
    
    private let router: RouterService
    private let flow: Flow
    @State private var selectedCategories: Set<NewsNetworkManager.Category> = Set()
    @State private var isAlertPresenting = false
    @State private var loading = false
    
    init(flow: Flow, router: RouterService) {
        self.flow = flow
        self.router = router
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    TitleHeaderView(
                        title: flow == .main ? "Categories" : "Select your favorite topics",
                        subtitle: flow == .main ? "Thousands of articles in each category" : "Select some of your favorite topics to let us suggest better news for you."
                    )
                    ScrollView {
                        LazyVGrid(
                            columns: [
                                .init(spacing: 16),
                                .init()
                            ],
                            spacing: 16,
                            content: {
                                ForEach(NewsNetworkManager.Category.allCases, id: \.self) {
                                    category in
                                    
                                    Button(
                                        action: {
                                            tapCategory(category)
                                        },
                                        label: {
                                            Text(category.title)
                                                .foregroundColor(selectedCategories.contains(category) ? .white : .grayDarker)
                                                .frame(maxWidth: .infinity, minHeight: 72)
                                                .background(selectedCategories.contains(category) ? Color.purplePrimary : .clear)
                                                .clipShape(.rect(cornerRadius: 12))
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 12)
                                                        .stroke(Color.grayLighter, lineWidth: 1)
                                                )
                                        }
                                    )
                                }
                            }
                        )
                    }
                    Button(
                        action: tapNext,
                        label: {
                            Text(flow == .main ? "Save" : "Next")
                                .frame(maxWidth: .infinity, minHeight: 56)
                                .foregroundColor(.white)
                                .background(Color.purplePrimary)
                                .clipShape(.rect(cornerRadius: 12))
                        }
                    )
                }
                .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                
                if loading {
                    VStack {
                        ProgressView()
                    }
                }
            }
        }
        .allowsHitTesting(!loading)
        .onAppear(perform: {
            if flow == .main {
                loading = true
            }
        })
        .task {
            if flow == .main {
                let selectedCategories =
                Set((await StorageService.shared.getFavoriteCategories()).compactMap {
                    NewsNetworkManager.Category(rawValue: $0)
                })
                self.selectedCategories = selectedCategories.contains(.all) ? Set(NewsNetworkManager.Category.allCases) : selectedCategories
                loading = false
            }
        }
        .alert(
            "Something go wrond",
            isPresented: $isAlertPresenting,
            actions: {
                Button("OK") { }
            }
        )
    }
    
    private func tapCategory(_ category: NewsNetworkManager.Category) {
        if selectedCategories.contains(category) {
            if category == .all {
                selectedCategories.removeAll()
            } else {
                selectedCategories.remove(.all)
                selectedCategories.remove(category)
            }
            return
        }
        if category == .all {
            selectedCategories = Set(NewsNetworkManager.Category.allCases)
            return
        } else {
            selectedCategories.insert(category)
        }
        
        if selectedCategories.count == NewsNetworkManager.Category.allCases.count - 1 {
            selectedCategories.insert(.all)
        }
    }
    
    private func tapNext() {
        Task {
            @MainActor in
            
            var selected = selectedCategories.contains(.all) ? [.all] : selectedCategories
            selected = selected.isEmpty ? [.all] : selected
            do {
                try await StorageService.shared.setFavoriteCategories(categories: selected.map { $0.rawValue })
                if flow == .onbording {
                    router.openApp()
                }
            } catch {
                isAlertPresenting = true
            }
        }
    }
}

extension NewsNetworkManager.Category {
    var title: String {
        switch self {
        case .all:
            return "📜 All"
        case .business:
            return "💼 Business"
        case .entertainment:
            return "🍿 Entertainment"
        case .general:
            return "🌎 General"
        case .health:
            return "💊 Health"
        case .science:
            return "🪐 Science"
        case .sports:
            return "⚽ Sports"
        case .technology:
            return "💻 Technology"
        }
    }
}

#Preview {
    CategoriesView(flow: .onbording, router: .init())
}
