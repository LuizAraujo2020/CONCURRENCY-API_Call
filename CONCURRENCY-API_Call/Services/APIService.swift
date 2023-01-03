//
//  APIService.swift
//  CONCURRENCY-API_Call
//
//  Created by Luiz Araujo on 01/01/23.
//

import UIKit

struct APIService {
    // MARK: - Errors
    enum RequestError: Error {
        case invalidRequest
        case failedToDecode
        case custom(error: Error)
    }
    
    func fetch<T: Codable>(_ url: URL,
                           type: T.Type) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw RequestError.invalidRequest
        }
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        
        return decodedData
    }
}


