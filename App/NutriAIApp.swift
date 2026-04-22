//
//  NutriAIApp.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//
import SwiftUI
import SwiftData

@main
struct NutriAIApp: App {

    @StateObject private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(appState)
        }
        .modelContainer(for: FavoriteMeal.self)
    }
}
