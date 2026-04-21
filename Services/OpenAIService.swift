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

        // SAFETY FALLBACK (so app NEVER breaks)
        guard apiKey != "YOUR_OPENAI_API_KEY" else {
            return [
                Meal(name: "Mock Chicken Bowl", calories: 500, protein: 35, carbs: 40),
                Meal(name: "Mock Oats Banana", calories: 300, protein: 10, carbs: 50),
                Meal(name: "Mock Protein Shake", calories: 250, protein: 25, carbs: 20)
            ]
        }

        let url = URL(string: "https://api.openai.com/v1/chat/completions")!

        let body: [String: Any] = [
            "model": "gpt-4o-mini",
            "messages": [
                [
                    "role": "user",
                    "content": "Generate 3 healthy meals for: \(prompt). Return short meal names only."
                ]
            ]
        ]

        let headers = [
            "Authorization": "Bearer \(apiKey)",
            "Content-Type": "application/json"
        ]

        let data = try await APIClient.shared.post(
            url: url,
            body: body,
            headers: headers
        )

        struct Response: Decodable {
            struct Choice: Decodable {
                struct Message: Decodable {
                    let content: String
                }
                let message: Message
            }
            let choices: [Choice]
        }

        let decoded = try JSONDecoder().decode(Response.self, from: data)

        let text = decoded.choices.first?.message.content ?? "No response"

        return [
            Meal(name: text, calories: 400, protein: 30, carbs: 40)
        ]
    }
}
