//
//  APIClient.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import Foundation

final class APIClient {

    static let shared = APIClient()
    private init() {}

    func post<T: Decodable>(
        url: URL,
        body: [String: Any],
        headers: [String: String]
    ) async throws -> T {

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = try JSONSerialization.data(withJSONObject: body)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let http = response as? HTTPURLResponse,
              200..<300 ~= http.statusCode else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}
