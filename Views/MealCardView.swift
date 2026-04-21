//
//  MealCardView.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import SwiftUI

struct MealCardView: View {
    let meal: Meal

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            Text(meal.name)
                .font(.headline)
                .foregroundColor(.primary)

            HStack(spacing: 12) {
                Label("\(meal.calories)", systemImage: "flame.fill")
                    .foregroundColor(.orange)

                Label("\(meal.protein)g", systemImage: "bolt.fill")
                    .foregroundColor(.green)

                Label("\(meal.carbs)g", systemImage: "leaf.fill")
                    .foregroundColor(.blue)
            }
            .font(.caption)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 3)
        )
        .padding(.horizontal)
    }
}
