//
//  AppState.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import Foundation

@MainActor
class AppState: ObservableObject {

    let mealViewModel: MealViewModel

    init() {
        let service = OpenAIService()
        let repository = MealRepositoryImpl(service: service)
        let useCase = GenerateMealsUseCase(repository: repository)

        self.mealViewModel = MealViewModel(useCase: useCase)
    }
}
