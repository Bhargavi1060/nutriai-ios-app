//
//  Meal.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import Foundation

struct Meal: Identifiable {
    let id = UUID()
    let name: String
    let calories: Int
    let protein: Int
    let carbs: Int
}
