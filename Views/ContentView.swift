//
//  ContentView.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = MealViewModel()
    @State var goal: String = "Fitness"

    var body: some View {

        NavigationView {

            VStack {

                TextField("Enter goal", text: $goal)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                Button("Generate Meals") {
                    Task {
                        await viewModel.fetchMeals(goal: goal)
                    }
                }
                .buttonStyle(.borderedProminent)

                if viewModel.isLoading {
                    ProgressView("Loading...")
                }

                List(viewModel.meals) { meal in
                    VStack(alignment: .leading) {
                        Text(meal.name).bold()
                        Text("Calories: \(meal.calories)")
                        Text("Protein: \(meal.protein)g")
                    }
                }
            }
            .navigationTitle("NutriAI")
        }
    }
}

#Preview {
    ContentView()
}
