//
//  ContentView.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = MealViewModel()
    @State private var goal: String = "Fitness"

    var body: some View {

        NavigationView {
            VStack(spacing: 16) {

                // MARK: - Input Field
                TextField("Enter your goal (e.g. lose weight)", text: $goal)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                // MARK: - Generate Button
                Button("Generate AI Meals") {
                    Task {
                        await viewModel.generateMeals(goal: goal)
                    }
                }
                .buttonStyle(.borderedProminent)

                // MARK: - Loading State
                if viewModel.isLoading {
                    ProgressView("Generating meals...")
                        .padding()
                }

                // MARK: - Error State
                if let error = viewModel.error {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding()
                }

                // MARK: - Meal Cards UI
                ScrollView {

                    VStack(spacing: 12) {

                        ForEach(viewModel.meals) { meal in

                            VStack(alignment: .leading, spacing: 8) {

                                Text(meal.name)
                                    .font(.headline)

                                HStack {
                                    Text("🔥 \(meal.calories)")
                                    Text("💪 \(meal.protein)g protein")
                                    Text("🌾 \(meal.carbs)g carbs")
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
                    .padding(.top)
                }

                Spacer()
            }
            .navigationTitle("NutriAI 🍎")
        }
    }
}

#Preview {
    ContentView()
}

#Preview {
    ContentView()
}
