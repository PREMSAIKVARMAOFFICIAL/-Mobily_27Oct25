# Mobily — Cellular Usage Demo App  
*A SwiftUI + MVVM assignment demonstrating modern declarative UI, clean architecture, and state management.*

---

## Overview
Mobily is a demo iOS application that displays a user’s **cellular usage details** (data, minutes, SMS) and showcases **promotional packages and subscription plans**.

The project follows **MVVM architecture** with a clear separation of concerns, reactive state updates, and a responsive SwiftUI interface.

---

## Features

### Usage Dashboard
- Displays:
  - Data usage: `2.3 GB of 5 GB`
  - Minutes: `340 of 1000`
  - SMS: `120 of 500`
  - Renewal date and remaining days
- Progress bars visualize each category
- Auto-refresh simulates live usage updates every few seconds

### Promotions Section
- Carousel banners for available offers  
- Each banner includes title, description, and **“Know More” / “Subscribe”** button  
- Smooth transitions and light/dark mode support

### Available Plans Page
- List of subscription plans with:
  - Name, price, data/minutes/SMS limits  
  - Mock “Subscribe” action (shows success alert)  
- Clean and scalable card-based layout  

### Settings
- Toggle local notifications
- Schedule a “Low Balance Reminder”
- Simple app info section

---

## Architecture

| Layer | Description |
|-------|--------------|
| **Model** | Defines data structures: `Usage`, `Plan`, `Promotion` |
| **ViewModel** | Manages business logic, publishes reactive state |
| **View** | SwiftUI screens bound to ViewModels |
| **Services** | `UsageService`, `PlanService`, `PromotionService` with `MockDataService` implementation |
| **DI Container** | `AppContainer` injects all dependencies |
| **Notifications** | `NotificationManager` schedules local reminders |

---

## Tech Stack
- **Language:** Swift 5.9  
- **Framework:** SwiftUI (iOS 17+)  
- **Architecture:** MVVM + Dependency Injection  
- **Data Source:** Local mock data (in-memory)  
- **Testing:** Unit test for ViewModel progress logic  

---

## Dynamic Updates
Usage values auto-increment periodically to simulate live cellular usage updates.  
This behavior is disabled in SwiftUI Previews to prevent preview crashes.

---

## Build & Run

### Requirements
- macOS 14+  
- Xcode 15+  
- iOS 17 Simulator or real device
