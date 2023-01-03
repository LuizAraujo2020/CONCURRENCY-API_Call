//
//  ContentService.swift
//  CONCURRENCY-API_Call
//
//  Created by Luiz Araujo on 01/01/23.
//

import Foundation

struct ContentService {
    typealias Content = (users: [User], posts: [Post])
    
    func fetchContent() async throws -> Content {
        let urlUsers = "https://jsonplaceholder.typicode.com/users"
        let users    = try await APIService().fetch(URL(string: urlUsers)!, type: [User].self)
        
        let urlPosts = "https://jsonplaceholder.typicode.com/posts"
        let posts    = try await APIService().fetch(URL(string: urlPosts)!, type: [Post].self)
        
        return (users, posts)
    }
}
