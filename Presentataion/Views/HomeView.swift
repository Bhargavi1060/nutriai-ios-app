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

            // HEADER
            VStack(spacing: 10) {

                Text("NutriAI")
                    .font(.system(size: 34, weight: .bold, design: .rounded))

                Text("Your AI-powered nutrition coach")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)

                Text("Generate personalized meal plans instantly")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(
                    colors: [Color.green.opacity(0.15), Color.blue.opacity(0.08)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(20)
            .padding(.horizontal)

            // GOAL SECTION
            VStack(alignment: .leading, spacing: 10) {

                Text("Your Goal")
                    .font(.headline)

                TextField("e.g. fat loss, muscle gain, high protein", text: $goal)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            // ACTION BUTTON
            Button {

                Task {
                    await viewModel.generateMeals(goal: goal)

                    DispatchQueue.main.async {
                        appState.goToMeals = true
                    }
                }

            } label: {

                HStack {

                    Image(systemName: "sparkles")
                    Text("Generate Meal Plan")
                        .fontWeight(.semibold)
                }
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
                .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 4)
            }
            .padding(.horizontal)

            // LOADING STATE
            if viewModel.isLoading {
                VStack(spacing: 8) {
                    ProgressView()
                    Text("Creating your personalized meal plan...")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
            }

            // ERROR STATE
            if let error = viewModel.error {
                Text(error)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.horizontal)
            }

            Spacer()

            // FOOTER
            VStack(spacing: 6) {
                Text("AI Nutrition Engine")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .padding(.bottom, 10)
        }
        .padding(.top, 20)
    }
}
