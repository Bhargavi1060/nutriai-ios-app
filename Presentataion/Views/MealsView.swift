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

        ScrollView {

            VStack(spacing: 12) {

                ForEach(viewModel.meals) { meal in

                    VStack(alignment: .leading, spacing: 6) {
                        Text(meal.name)
                            .font(.headline)

                        Text("🔥 \(meal.calories) | 💪 \(meal.protein)g | 🌾 \(meal.carbs)g")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }
            }
            .padding()
        }
    }
}
