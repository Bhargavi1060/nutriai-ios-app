import Foundation

class OpenAIService {

    func generateMeals(prompt: String) async throws -> [MealDTO] {

        print("API called with:", prompt)

        // MOCK (replace with real API later)
        return [
            MealDTO(name: "Chicken Salad", calories: 400, protein: 35, carbs: 20),
            MealDTO(name: "Oats Bowl", calories: 300, protein: 10, carbs: 50),
            MealDTO(name: "Egg Whites Toast", calories: 250, protein: 20, carbs: 15)
        ]
    }
}
