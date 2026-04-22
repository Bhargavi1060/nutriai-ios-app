//
//  FavoriteMeal.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import Foundation
import SwiftData

@Model
class FavoriteMeal {

    var id: UUID
    var name: String
    var calories: Int
    var protein: Int
    var carbs: Int

    init(name: String, calories: Int, protein: Int, carbs: Int) {
        self.id = UUID()
        self.name = name
        self.calories = calories
        self.protein = protein
        self.carbs = carbs
    }
}
