//
//  Comment.swift
//  CONCURRENCY-API_Call
//
//  Created by Luiz Araujo on 01/01/23.
//

struct Comment: Codable, Identifiable {
    let id: Int
    var postId: Int
    var name: String
    var email: String
    var body: String
    
    internal init() {
        self.id     = Int.random(in: 0...100_000_000_000)
        self.postId = Int.random(in: 0...100_000_000_000)
        self.name   = ""
        self.email  = ""
        self.body   = ""
    }
    
    internal init(id: Int, postId: Int, name: String, email: String, body: String) {
        self.id = id
        self.postId = postId
        self.name = name
        self.email = email
        self.body = body
    }
}
