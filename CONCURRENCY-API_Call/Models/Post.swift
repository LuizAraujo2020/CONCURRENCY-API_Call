//
//  Post.swift
//  CONCURRENCY-API_Call
//
//  Created by Luiz Araujo on 01/01/23.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
