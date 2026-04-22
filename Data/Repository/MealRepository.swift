//
//  MealRepository.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import Foundation

protocol MealRepository {
    func generateMeals(goal: String) async throws -> [MealDTO]
}
