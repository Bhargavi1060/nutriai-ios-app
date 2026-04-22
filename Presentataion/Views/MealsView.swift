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

        VStack(alignment: .leading, spacing: 16) {

            // HEADER
            Text("Your AI Meal Plan")
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)

            // EMPTY STATE
            if viewModel.meals.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "fork.knife")
                        .font(.system(size: 40))
                        .foregroundColor(.gray)

                    Text("No meals generated yet")
                        .foregroundColor(.gray)

                    Text("Go to Home and create your meal plan")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.top, 60)

            } else {

                // MEAL LIST
                ScrollView {

                    VStack(spacing: 12) {

                        ForEach(viewModel.meals) { meal in

                            VStack(alignment: .leading, spacing: 8) {

                                Text(meal.name)
                                    .font(.headline)

                                HStack(spacing: 12) {
                                    Label("\(meal.calories)", systemImage: "flame.fill")
                                    Label("\(meal.protein)g", systemImage: "bolt.fill")
                                    Label("\(meal.carbs)g", systemImage: "leaf.fill")
                                }
                                .font(.caption)
                                .foregroundColor(.gray)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top, 10)
                }
            }

            Spacer()
        }
        .padding(.top)
    }
}
