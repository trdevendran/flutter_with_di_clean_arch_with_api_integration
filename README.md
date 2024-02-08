# flutter_exam

This is a Flutter project showcasing the implementation of Clean Architecture with the BLoC pattern.
The project is structured to promote separation of concerns, maintainability, and scalability.

## Table of Contents

- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [Features](#features)
- [Architecture Overview](#architecture-overview)
- [Code Organization](#code-organization)

## Introduction

This project made is for a system task for the flutter app development which follows the principles
of Clean Architecture, promoting a separation of concerns into layers (presentation, domain, and
data) for improved maintainability and testability. The BLoC (Business Logic Component) pattern is
employed for state management.

## Project Structure

The project is organized into the following main directories:

- `lib`: Contains the Dart source code.
    - `data`: Implementation of data layer (repositories, data sources).
    - `domain`: Business logic layer (entities, use cases, repositories interfaces).
    - `presentation`: User interface layer (UI components, BLoCs).
    - `core`: Shared code and utilities.
    - `injections`: Dependency injection setup.
- `test`: Unit and widget tests.

## Technologies Used

- Flutter
- Dart
- BLoC Pattern
- GetIt as Dependency Injection
- Clean Architecture
- http (HTTP client for data layer)
- flutter_test (for testing)

## Getting Started

1. Clone the repository and prepare codebase to run:
   ```bash
   git clone https://github.com/calibraint/flutter_exam.git
   cd flutter_exam
   flutter pub get
   flutter run
2. Open your preferred IDE and make sure the platform type to build and run as this will support below mentioned platforms
    - Android
    - iOS
    - Web

## Features
1. Person list page as a home/default page (Data will be fetched from the FakeAPI based on query limit)
> I have not made any custom logic to locally maintain data for the list as the FakerAPI provides different data set everytime but handled pagination as expected.Note: I have not made any custom logic to maintain data for the list as the FakerAPI provides different data set everytime but handled pagination as expected.
2. Person's Detail page - This page will be redirected by app when user tap on any person as shows in the list page.

## Architecture Overview

### System Overview Diagram:
```yaml
+--------------------------+
|    Presentation       |
|        Layer             |
+-------------------------+
|                             |
|   Business Logic    |
|      (Domain)          |
|        Layer             |
|                             |
+--------------------------+
|      Data Layer       |
+-------------------------+
```

### Clean Architecture Layers:
```yaml
+---------------------+
|      Entities       |
|       Layer         |
+---------------------+
↑
+-----------------------+
|      Use Cases    |
|       Layer          |
+----------------------+
↑
+------------------------------+
|   Interface Adapters   |
|       Layer                   |
+------------------------------+
↑
+-------------------------------+
|   Frameworks & Tools |
|       Layer                   |
+-------------------------------+
```

### Presentation Layer

The presentation layer is responsible for handling user interface components. It uses Flutter widgets, screens, and BLoCs to manage UI state.

### Domain Layer

The domain layer contains the business logic of our application. It includes entities representing core business concepts and use cases to encapsulate business rules and application logic.

### Data Layer

The data layer is responsible for interacting with external data sources. It includes repositories and data sources for retrieving and storing data.

### Data Flow

Data flows through our system from the user interface to the domain layer and back. Dependencies are carefully managed to ensure a clean and modular architecture.

For code examples and more details, explore our project further. Feel free to contribute, ask questions, or provide feedback. We appreciate your involvement in our project!

## Code Organization
### Root Directory:
```yaml
├── lib/
├── test/
├── android/
├── ios/
├── web/
├── pubspec.yaml
└── README.md
```
### `lib` Directory:
```yaml
lib/
├── core/
├── features/
├── injections/
└── main.dart
```

### `main.dart`

The `main.dart` file serves as the main entry point for our application. It includes configurations and features necessary for the app to run.

Explore the project further to see code examples and understand the interaction between different layers. Feel free to contribute or ask questions if needed.
