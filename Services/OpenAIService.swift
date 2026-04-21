//
//  OpenAIService.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import Foundation

final class OpenAIService {

    private let apiKey = "YOUR_OPENAI_API_KEY"

    func generateMeals(prompt: String) async throws -> [Meal] {

        let url = URL(string: "https://api.openai.com/v1/chat/completions")!

        let body: [String: Any] = [
            "model": "gpt-4o-mini",
            "messages": [
                ["role": "user", "content": "Generate 3 healthy meals for: \(prompt). Return JSON format."]
            ]
        ]

        let headers = [
            "Authorization": "Bearer \(apiKey)",
            "Content-Type": "application/json"
        ]

        struct Response: Decodable {
            let choices: [Choice]
            struct Choice: Decodable {
                let message: Message
                struct Message: Decodable {
                    let content: String
                }
            }
        }

        let response: Response = try await APIClient.shared.post(
            url: url,
            body: body,
            headers: headers
        )

        // Simple parsing (can be improved later)
        let text = response.choices.first?.message.content ?? ""

        return [
            Meal(name: text, calories: 400, protein: 30, carbs: 40)
        ]
    }
}
