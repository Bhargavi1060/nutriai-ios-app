//
//  GenerateMealsUseCase.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import Foundation

class GenerateMealsUseCase {

    private let repository: MealRepository

    init(repository: MealRepository) {
        self.repository = repository
    }

    func execute(goal: String) async throws -> [MealDTO] {
        return try await repository.generateMeals(goal: goal)
    }
}
