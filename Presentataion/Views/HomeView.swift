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

        VStack(spacing: 20) {

            Text("NutriAI")
                .font(.largeTitle)
                .bold()

            TextField("Enter goal", text: $goal)
                .textFieldStyle(.roundedBorder)
                .padding()

            Button {

                Task {
                    await viewModel.generateMeals(goal: goal)

                    DispatchQueue.main.async {
                        appState.goToMeals = true
                    }
                }

            } label: {

                Text("Generate Meal Plan")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
    }
}
