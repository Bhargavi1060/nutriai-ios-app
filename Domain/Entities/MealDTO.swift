//
//  MealDTO.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/22/26.
//

import Foundation

struct MealDTO: Identifiable, Codable {
    let id = UUID()
    let name: String
    let calories: Int
    let protein: Int
    let carbs: Int
}
