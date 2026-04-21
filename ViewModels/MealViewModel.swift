//
//  MealViewModel.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import Foundation

@MainActor
class MealViewModel: ObservableObject {

    @Published var meals: [Meal] = []
    @Published var isLoading = false
    @Published var error: String?

    private let service = OpenAIService()

    func generateMeals(goal: String) async {

        isLoading = true
        error = nil

        do {
            let result = try await service.generateMeals(prompt: goal)
            self.meals = result
        } catch {
            print("Error:", error)
            self.error = error.localizedDescription
        }

        isLoading = false
    }
}
