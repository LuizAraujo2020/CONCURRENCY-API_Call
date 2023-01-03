//
//  Todo.swift
//  CONCURRENCY-API_Call
//
//  Created by Luiz Araujo on 01/01/23.
//

import Foundation

struct Todo: Codable, Identifiable {
    let id: Int
    let userId: Int
    var title: String
    var completed: Bool
}
