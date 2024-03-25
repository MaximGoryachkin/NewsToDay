//
//  RouterService.swift
//  NewsToDay
//
//  Created by Victor on 23.03.2024.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

final class RouterService: ObservableObject {
    
    enum Screen {
        case onbording
        case favoriteTopics
        case authorization
        case main
    }
    
    @Published var screen: Screen
    
    private let storage = StorageService.shared
    
    init() {
        guard Auth.auth().currentUser != nil else {
            screen = .authorization
            return
        }
        screen = .main
    }
    
    func openApp() {
        Task {
            @MainActor in
            screen = await storage.needToShowOnbording ? .onbording : .main
            await storage.setNeedToShowOnbording(false)
        }
    }
    
    func openAuth() {
        screen = .authorization
    }
    
    func openFavoriteTopics() {
        screen = .favoriteTopics
    }
}
