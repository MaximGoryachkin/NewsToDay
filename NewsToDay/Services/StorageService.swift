//
//  StorageService.swift
//  NewsToDay
//
//  Created by Victor on 19.03.2024.
//

import Foundation
import FirebaseDatabase
import NewsNetworkManager

final actor StorageService {
    static let shared = StorageService()
    
    private var userId: String? {
        AuthorizeService.shared.userId
    }
    
    private var userName: String?
    private var userEmail: String?
    private var favoriteCategories = [String]()
    private var bookmarks = [ArticleEntity]()
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
    
    func addBookmark(_ bookmark: ArticleEntity) async throws {
        var bookmarks = await getBookmarks()
        bookmarks.append(bookmark)
        try await setBookmakrs(bookmarks: bookmarks)
    }
    
    func removeBookmark(_ bookmark: ArticleEntity) async throws {
        var tempBookmarks = bookmarks
        tempBookmarks.removeAll(where: { $0.title == bookmark.title && $0.author == bookmark.author })
        try await setBookmakrs(bookmarks: bookmarks)
        bookmarks = tempBookmarks
    }
    
    func setBookmakrs(bookmarks: [ArticleEntity]) async throws {
        guard let userId else {
            return
        }
        
        let ref = Database.database().reference().child("users").child(userId)
        var encoded = [[String: Any]]()
        let encoder = JSONEncoder()
        for bookmark in bookmarks {
            let e = try encoder.encode(bookmark)
            let ee = try JSONSerialization.jsonObject(with: e) as! [String: Any]
            encoded.append(ee)
        }
        try await ref.updateChildValues(["bookmarks": encoded])
        
        self.bookmarks = bookmarks
        
    }
    
    func getBookmarks() async -> [ArticleEntity] {
        
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
        guard let dictionaries = snapshot.value as? [[String: Any]] else {
            return []
        }
        var bookmarks = [ArticleEntity]()
        for dict in dictionaries {
            guard let bookmark = try? JSONDecoder().decode(ArticleEntity.self, from: JSONSerialization.data(withJSONObject: dict)) else {
                continue
            }
            bookmarks.append(bookmark)
        }
        self.bookmarks = bookmarks
        return bookmarks
    }
    
    func setNeedToShowOnbording(_ value: Bool) {
        needToShowOnbording = value
    }
}
