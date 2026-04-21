//
//  AIService.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import Foundation

class AIService {

    func getMeals(goal: String) async -> [Meal] {

        try? await Task.sleep(nanoseconds: 1_000_000_000)

        return [
            Meal(name: "Chicken Bowl", calories: 500, protein: 35, carbs: 45),
            Meal(name: "Oats & Banana", calories: 300, protein: 10, carbs: 50),
            Meal(name: "Protein Shake", calories: 250, protein: 25, carbs: 20)
        ]
    }
}
