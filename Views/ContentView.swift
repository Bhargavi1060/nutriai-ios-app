//
//  ContentView.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = MealViewModel()
    @State private var goal: String = ""

    var body: some View {

        NavigationView {
            VStack(spacing: 16) {

                // MARK: Title
                Text("NutriAI")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                // MARK: Input Field
                TextField("Enter your goal (e.g. fat loss, muscle gain)", text: $goal)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)

                // MARK: Button
                Button {
                    Task {
                        await viewModel.generateMeals(goal: goal)
                    }
                } label: {
                    Text("Generate AI Meals")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }

                // MARK: Loading State
                if viewModel.isLoading {
                    ProgressView("Generating meals...")
                        .padding()
                }

                // MARK: Error State
                if let error = viewModel.error {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.horizontal)
                }

                // MARK: Meals List 
                ScrollView {

                    VStack(spacing: 14) {

                        ForEach(viewModel.meals) { meal in
                            MealCardView(meal: meal)
                        }
                    }
                    .padding(.top)
                }

                Spacer()
            }
            .navigationBarHidden(true)
        }
        .animation(.easeInOut, value: viewModel.meals)
    }
}

#Preview {
    ContentView()
}
