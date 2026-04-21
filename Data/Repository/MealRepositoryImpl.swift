//
//  MealRepositoryImpl.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import Foundation

final class MealRepositoryImpl: MealRepository {

    private let service: OpenAIService

    init(service: OpenAIService) {
        self.service = service
    }

    func generateMeals(goal: String) async throws -> [Meal] {
        return try await service.generateMeals(prompt: goal)
    }
}
