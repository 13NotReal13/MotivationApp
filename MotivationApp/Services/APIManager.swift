//
//  APIManager.swift
//  MotivationApp
//
//  Created by Иван Семикин on 30/07/2025.
//

import Foundation

final class APIManager {
    let url = URL(string: "https://api.api-ninjas.com/v1/quotes")
    let apiKey: (header: String, key: String) = ("X-Api-Key", "dbWpzMfCWWNQ8pUnNhXApg==AGXNB9nrsE0TkO0h")
    
    static let shared = APIManager()
    private init() {}
    
    func fetchQuotes() async throws -> [Quote] {
        guard let url = url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.setValue(apiKey.key, forHTTPHeaderField: apiKey.header)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode([Quote].self, from: data)
    }
}
