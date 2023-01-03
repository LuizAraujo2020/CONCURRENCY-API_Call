//
//  ContentViewModel.swift
//  CONCURRENCY-API_Call
//
//  Created by Luiz Araujo on 01/01/23.
//

import Foundation

@MainActor
final class ContentViewModel: ObservableObject {
    @Published var albums   = [Album]()
    @Published var comments = [Comment]()
    @Published var photos   = [Photo]()
    @Published var posts    = [Post]()
    @Published var todos    = [Todo]()
    @Published var users    = [User]()
    
    func fetch(type: TypeOfData) async {
        let url  = "https://jsonplaceholder.typicode.com"
        do {
            
            switch type {
                case .album:
                    let temp = try await APIService().fetch(URL(string: url + type.endpoint)!, type: [Album].self)
                    print(temp)
                    self.albums = temp
                    
                case .comment:
                    let temp = try await APIService().fetch(URL(string: url + type.endpoint)!, type: [Comment].self)
                    print(temp)
                    self.comments = temp
                    
                case .photo:
                    let temp = try await APIService().fetch(URL(string: url + type.endpoint)!, type: [Photo].self)
                    print(temp)
                    self.photos = temp
                    
                case .post:
                    let temp = try await APIService().fetch(URL(string: url + type.endpoint)!, type: [Post].self)
                    print(temp)
                    self.posts = temp
                    
                case .todo:
                    let temp = try await APIService().fetch(URL(string: url + type.endpoint)!, type: [Todo].self)
                    print(temp)
                    self.todos = temp
                    
                case .user:
                    let temp = try await APIService().fetch(URL(string: url + type.endpoint)!, type: [User].self)
                    print(temp)
                    self.users = temp
            }
        } catch {
            return
        }
    }
}


enum TypeOfData: CaseIterable {
    case album, comment, photo, post, todo, user
    
//    var type: Codable {
//        switch self {
//            case .album:
//                return Album.self as! Decodable & Encodable
//            case .comment:
//                return Comment.self as! Decodable & Encodable
//            case .photo:
//                return Photo.self as! Decodable & Encodable
//            case .post:
//                return Post.self as! Decodable & Encodable
//            case .todo:
//                return Todo.self as! Decodable & Encodable
//            case .user:
//                return User.self as! Decodable & Encodable
//        }
//    }
    
//    var typeCollection: [Codable] {
//        switch self {
//            case .album:
//                return [Album.self as! Decodable & Encodable].self
//            case .comment:
//                return [Comment.self as! Decodable & Encodable].self
//            case .photo:
//                return [Photo.self as! Decodable & Encodable].self
//            case .post:
//                return [Post.self as! Decodable & Encodable].self
//            case .todo:
//                return [Todo.self as! Decodable & Encodable].self
//            case .user:
//                return [User.self as! Decodable & Encodable].self
//        }
//    }
    
    var endpoint: String {
        switch self {
            case .album:
                return "/albums"
            case .comment:
                return "/comments"
            case .photo:
                return "/photos"
            case .post:
                return "/posts"
            case .todo:
                return "/todos"
            case .user:
                return "/users"
        }
    }
}
