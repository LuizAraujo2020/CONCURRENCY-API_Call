//
//  Album.swift
//  CONCURRENCY-API_Call
//
//  Created by Luiz Araujo on 01/01/23.
//

struct Album: Codable, Identifiable {
    let id: Int
    let userId: Int
    var title: String 
}
