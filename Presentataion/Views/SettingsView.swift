//
//  SettingsView.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/21/26.
//

import SwiftUI

struct SettingsView: View {

    var body: some View {
        VStack(spacing: 16) {

            Text("Settings")
                .font(.title)
                .fontWeight(.bold)

            Text("Version 1.0")
                .foregroundColor(.gray)

            Spacer()
        }
        .padding()
    }
}
