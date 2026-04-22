# NutriAI – AI Powered Meal Planner

NutriAI is an iOS application that generates personalized meal plans using AI based on user goals like fat loss, muscle gain, or high-protein diet. Built using **SwiftUI, MVVM architecture, and OpenAI API integration**.

---

## Features

- AI-generated meal plans based on user goals
- Clean MVVM + UseCase architecture
- Modern SwiftUI interface
- Save meals using SwiftData (Favorites support)
- Real-time API integration (OpenAI-ready)
- Structured meal nutrition breakdown (calories, protein, carbs)

---

## Tech Stack

- Swift 5
- SwiftUI
- SwiftData
- MVVM Architecture
- Clean Architecture (Repository + UseCase layer)
- OpenAI API (GPT-based meal generation)
- Async/Await concurrency

---

## Architecture

The app follows a clean layered architecture:
UI (SwiftUI Views)
↓
ViewModel (State Management)
↓
UseCase (Business Logic)
↓
Repository (Abstraction Layer)
↓
Service (OpenAI API / Mock Data)

This ensures:
- Separation of concerns
- Testability
- Scalability for production apps

---

## Screens

### Home Screen
- Enter fitness goal
- Generate AI meal plan

### Meal Screen
- Displays AI-generated meals
- Calories, protein, carbs breakdown

---

## How It Works

1. User enters a goal (e.g., "fat loss")
2. App sends request to OpenAI API
3. AI generates structured meal plan (JSON)
4. Data flows through:
   - Service → Repository → UseCase → ViewModel
5. SwiftUI automatically updates UI

