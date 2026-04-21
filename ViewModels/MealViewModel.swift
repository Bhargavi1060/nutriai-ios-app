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

    private let service = AIService()

    func fetchMeals(goal: String) async {

        isLoading = true

        let result = await service.getMeals(goal: goal)
        self.meals = result

        isLoading = false
    }
}
