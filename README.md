NutriAI is a SwiftUI-based iOS application that generates personalized meal plans using AI.
It is built using Clean Architecture principles (MVVM + UseCase + Repository pattern) to ensure scalability, testability, and production readiness

**Features**
AI-powered meal generation using OpenAI API
Displays structured meal cards with calories, protein, and carbs
Built with Swift Concurrency (async/await)
Clean Architecture (View → ViewModel → UseCase → Repository → Service)
Modern SwiftUI UI with reusable components
Loading and error state handling
Modular and scalable project structure

**Architecture**
This project follows Clean Architecture principles:
Presentation Layer
SwiftUI Views (ContentView)
ViewModels (MealViewModel)
Domain Layer
UseCases (GenerateMealsUseCase)
Entities (Meal)
Data Layer
Repository (MealRepositoryImpl)
Services (OpenAIService, APIClient)

**Tech Stack**
Swift
SwiftUI
MVVM Architecture
Clean Architecture (UseCase + Repository pattern)
Async/Await Concurrency
URLSession Networking

**App Flow**
User enters a health goal (e.g., fat loss, muscle gain)
ViewModel triggers UseCase
UseCase calls Repository
Repository fetches data from OpenAI Service
AI returns meal suggestions
UI displays structured meal cards
