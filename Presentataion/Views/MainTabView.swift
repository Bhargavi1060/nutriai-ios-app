//
//  MainTabView.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import SwiftUI

struct MainTabView: View {

    @EnvironmentObject var appState: AppState

    var body: some View {

        NavigationStack {

            TabView {

                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }

                MealsView()
                    .tabItem {
                        Label("Meals", systemImage: "fork.knife")
                    }
            }

            // NAVIGATION 
            .navigationDestination(isPresented: $appState.goToMeals) {
                MealsView()
            }
        }
    }
}
