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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Meal.self)
    }
}
