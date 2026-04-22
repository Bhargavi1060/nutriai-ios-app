//
//  OpenAIResponse.swift
//  NutriAI
//
//  Created by Bhargavi M on 4/22/26.
//

import Foundation

struct OpenAIResponse: Decodable {
    let choices: [Choice]
}

struct Choice: Decodable {
    let message: Message
}

struct Message: Decodable {
    let content: String
}
