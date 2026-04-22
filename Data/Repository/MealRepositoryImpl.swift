//
//  MealRepositoryImpl.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
import Foundation

class MealRepositoryImpl: MealRepository {

    private let service: OpenAIService

    init(service: OpenAIService) {
        self.service = service
    }

    func generateMeals(goal: String) async throws -> [MealDTO] {
        return try await service.generateMeals(prompt: goal)
    }
}
