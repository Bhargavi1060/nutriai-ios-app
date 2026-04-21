//
//  GenerateMealsUseCase.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import Foundation

final class GenerateMealsUseCase {

    private let repository: MealRepository

    init(repository: MealRepository) {
        self.repository = repository
    }

    func execute(goal: String) async throws -> [Meal] {
        return try await repository.generateMeals(goal: goal)
    }
}
