//
//  StorageService.swift
//  NewsToDay
//
//  Created by Victor on 19.03.2024.
//

import Foundation
import FirebaseDatabase

final actor StorageService {
    static let shared = StorageService()
    
    private var userId: String? {
        AuthorizeService.shared.userId
    }
    
    private var userName: String?
    private var userEmail: String?
    private var favoriteCategories = [String]()
    private var bookmarks = [String]()
    var needToShowOnbording: Bool {
        get {
            UserDefaults.standard.bool(forKey: "needToShowOnbording")
        }
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: "needToShowOnbording")
        }
    }
    
    private init() {
        
    }
    
    func logout() {
        userName = ""
        favoriteCategories = []
        bookmarks = []
    }
    
    func getUserName() async throws -> String? {
        guard let userId else {
            return nil
        }
        
        if let userName {
            return userName
        }
        
        let ref = Database.database().reference().child("users").child(userId).child("username")
        guard let snapshot = try? await ref.getData() else {
            return nil
        }
        userName = snapshot.value as? String
        return userName
    }
    
    func setUserName(_ name: String) async throws {
        guard let userId else {
            return
        }
        
        let ref = Database.database().reference().child("users").child(userId)
        _ = try? await ref.updateChildValues(["username": name])
    }
    
    func getUserEmail() async throws -> String? {
        guard let userId else {
            return nil
        }
        
        if let userEmail {
            return userEmail
        }
        
        let ref = Database.database().reference().child("users").child(userId).child("email")
        guard let snapshot = try? await ref.getData() else {
            return nil
        }
        userEmail = snapshot.value as? String
        return userEmail
    }
    
    func setFavoriteCategories(categories: [String]) async throws {
        guard let userId else {
            return
        }
        
        favoriteCategories = categories
        
        let ref = Database.database().reference().child("users").child(userId)
        try await ref.updateChildValues(["categories": categories])
    }
    
    func getFavoriteCategories() async -> [String] {
        guard let userId else {
            return []
        }
        
        if !favoriteCategories.isEmpty {
            return favoriteCategories
        }
        
        let ref = Database.database().reference().child("users").child(userId).child("categories")
        guard let snapshot = try? await ref.getData() else {
            return []
        }
        favoriteCategories = snapshot.value as? [String] ?? []
        return favoriteCategories
    }
    
    func setBookmakrs(bookmarks: [String]) async throws {
        guard let userId else {
            return
        }
        
        self.bookmarks = bookmarks
        
        let ref = Database.database().reference().child("users").child(userId)
        try await ref.updateChildValues(["bookmarks": bookmarks])
    }
    
    func getBookmarks() async -> [String] {
        
        guard let userId else {
            return []
        }
        
        if !bookmarks.isEmpty {
            return bookmarks
        }
        
        let ref = Database.database().reference().child("users").child(userId).child("bookmarks")
        guard let snapshot = try? await ref.getData() else {
            return []
        }
        bookmarks = snapshot.value as? [String] ?? []
        return bookmarks
    }
    
    func setNeedToShowOnbording(_ value: Bool) {
        needToShowOnbording = value
    }
}
