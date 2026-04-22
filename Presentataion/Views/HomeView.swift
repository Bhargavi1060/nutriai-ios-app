//
//  HomeView.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var appState: AppState
    @State private var goal: String = ""

    private var viewModel: MealViewModel {
        appState.mealViewModel
    }

    var body: some View {

        VStack(spacing: 24) {

            // HEADER SECTION
            VStack(spacing: 8) {

                Text("NutriAI")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.primary)

                Text("AI-powered meal planner for your fitness goals")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .padding(.top, 40)

            // INPUT SECTION
            VStack(alignment: .leading, spacing: 12) {

                Text("Your Goal")
                    .font(.headline)

                TextField("e.g. fat loss, muscle gain", text: $goal)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            // BUTTON
            Button {

                Task {
                    await viewModel.generateMeals(goal: goal)
                }

            } label: {

                Text("Generate Meal Plan")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [.black, .gray],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .foregroundColor(.white)
                    .cornerRadius(14)
                    .shadow(radius: 5)
            }
            .padding(.horizontal)

            // LOADING
            if viewModel.isLoading {
                ProgressView("Creating your plan...")
                    .padding()
            }

            // ERROR
            if let error = viewModel.error {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.horizontal)
            }

            Spacer()

            // FOOTER
            Text("Personalized nutrition")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
        }
        .padding()
    }
}
