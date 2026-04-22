//
//  MealViewModel.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import Foundation

@MainActor
class MealViewModel: ObservableObject {

    @Published var meals: [MealDTO] = []
    @Published var isLoading = false
    @Published var error: String?

    private let useCase: GenerateMealsUseCase

    init(useCase: GenerateMealsUseCase) {
        self.useCase = useCase
    }

    func generateMeals(goal: String) async {

        guard !goal.isEmpty else {
            error = "Please enter a goal"
            return
        }

        isLoading = true
        error = nil

        do {
            let result = try await useCase.execute(goal: goal)

            self.meals = result

        } catch {
            self.error = error.localizedDescription
        }

        isLoading = false
    }
}
