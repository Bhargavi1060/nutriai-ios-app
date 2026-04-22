//
//  MealsView.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import SwiftUI

struct MealsView: View {

    @EnvironmentObject var appState: AppState

    private var viewModel: MealViewModel {
        appState.mealViewModel
    }

    var body: some View {

        VStack {

            Text("Your Meal Plan")
                .font(.title)
                .bold()
                .padding()

            if viewModel.meals.isEmpty {

                Text("No meals generated yet")
                    .foregroundColor(.gray)

            } else {

                ScrollView {

                    VStack(spacing: 12) {

                        ForEach(viewModel.meals) { meal in

                            VStack(alignment: .leading, spacing: 6) {

                                Text(meal.name)
                                    .font(.headline)

                                Text("Cal: \(meal.calories) | Pro: \(meal.protein) | Carb: \(meal.carbs)")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
