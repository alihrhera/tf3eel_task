# 👥 Tf3eel Task - Flutter Users App

A modern Flutter application showcasing clean architecture principles through user management with paginated lists and detailed profiles, integrating with ReqRes.in mock API.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![API](https://img.shields.io/badge/API-ReqRes.in-green?style=for-the-badge)

## 📋 Task Overview

This Flutter application was developed as a technical assessment to demonstrate:

- **Clean Architecture Implementation** - Proper separation of concerns
- **API Integration** - Seamless connection with RESTful services
- **State Management** - Efficient data flow and UI updates
- **UI/UX Excellence** - Intuitive and responsive design
- **Code Quality** - Maintainable and scalable codebase

## ✨ Features

👤 **Detailed User Profiles** - Complete user information display  
🎨 **Modern UI Design** - Clean and intuitive interface  
⚡ **Fast Performance** - Optimized for smooth user experience  
📱 **Responsive Layout** - Works perfectly on all screen sizes  
🛠️ **Error Handling** - Graceful error management and recovery  
💾 **Image Caching** - Efficient image loading and storage

## 🏗️ Clean Architecture Structure

```
lib/
├── 🎯 core/                    # Core functionality
│   ├── constants/              # App constants & API endpoints
│   ├── error/                  # Custom exceptions & error handling
│   ├── network/                # HTTP client configuration
│   ├── utils/                  # Helper functions & extensions
│   └── di/                     # Dependency injection setup
│
├── 💾 data/                    # Data Layer
│   ├── datasources/            
│   │   ├── remote/             # API data sources
│   │   └── local/              # Local storage (if any)
│   ├── models/                 # Data models & JSON serialization
│   ├── repositories/           # Repository implementations
│   └── mapper/                 # Data transformation utilities
│
├── 🏢 domain/                  # Business Logic Layer
│   ├── entities/               # Business entities
│   ├── repositories/           # Repository contracts/interfaces
│   └── usecases/               # Business use cases
│       ├── get_users.dart
│       └── get_user_details.dart
│
├── 🎨 presentation/            # UI Layer
│   ├── pages/                  # Screen implementations
│   │   ├── users_list/
│   │   └── user_details/
│   ├── widgets/                # Reusable UI components
│   ├── providers/              # State management (Provider/Riverpod/Bloc)
│   └── theme/                  # App theming & styles
│
└── 🚀 main.dart               # Application entry point
```

## 🌐 API Integration

### Base URL
```
https://reqres.in/api
```

### Endpoints

| Endpoint | Method | Purpose | Response |
|----------|--------|---------|----------|
| `/users?page={page}` | GET | Fetch paginated users | JSONArray with pagination |
| `/users/{id}` | GET | Fetch single user details | JSONObject with user data |




## 🛠️ Tech Stack & Dependencies

### Core Technologies
- **Flutter SDK** `>=3.9.0` - Cross-platform framework


## 🚀 Getting Started

### Prerequisites
- Flutter SDK (version 3.0.0 or higher)
- Dart SDK (version 2.19.0 or higher)
- Android Studio / VS Code with Flutter extensions
- Git for version control

### Installation Steps
 you can try [APK](/res/apk-v1.apk) 

Or

1. **Clone the repository**
   ```bash
   git clone https://github.com/alihrhera/tf3eel_task.git
   cd tf3eel_task
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code (if using code generation)**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the application**
   ```bash
   # Debug mode
   flutter run
   
   # Release mode
   flutter run --release
   ```

### Building for Production

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS (on macOS only)
flutter build ios --release
```

## 📱 App Flow & User Experience


### Running Tests
```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# View coverage report
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

### Test Categories
- **Unit Tests**: Business logic, use cases, repositories
- **Widget Tests**: UI components and interactions
- **Integration Tests**: Complete user journeys
- **Golden Tests**: UI screenshot comparisons

## 🔧 Configuration & Setup

### Environment Setup
```dart
// lib/core/config/app_config.dart
class AppConfig {
  static const String baseUrl = 'https://reqres.in/api';
  static const int pageSize = 6;
  static const Duration timeoutDuration = Duration(seconds: 30);
}
```

### Network Configuration
```dart
// lib/core/network/dio_client.dart
class DioClient {
  static Dio createDio() {
    final dio = Dio(BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: AppConfig.timeoutDuration,
      receiveTimeout: AppConfig.timeoutDuration,
    ));
    
    // Add interceptors for logging, error handling, etc.
    dio.interceptors.addAll([
      LogInterceptor(requestBody: true, responseBody: true),
      ErrorInterceptor(),
    ]);
    
    return dio;
  }
}
```

## 📊 Performance Optimizations

### 🚀 Speed Optimizations
- **Image Caching**: Cached network images reduce loading time
- **Lazy Loading**: ListView.builder for optimal memory usage
- **Pagination**: Load data incrementally to improve initial load time
- **HTTP Client**: Dio with connection pooling and request optimization

### 🔄 User Experience
- **Smooth Animations**: Hero transitions and custom animations
- **Loading States**: Skeleton screens and progressive loading
- **Error Recovery**: Retry mechanisms and graceful error handling
- **Responsive Design**: Adaptive layouts for different screen sizes

## 🔮 Future Enhancements

### Phase 2 Features
- 🔍 **Advanced Search** - Filter users by multiple criteria
- 🌙 **Dark Theme** - Complete dark mode implementation
- 🌐 **Offline Support** - Local storage with synchronization
- 📧 **User Actions** - Contact user functionality
- 🔐 **Authentication** - User login and personalization

### Technical Improvements
- 📊 **Analytics Integration** - User behavior tracking
- 🔄 **Real-time Updates** - WebSocket integration
- 🧪 **A/B Testing** - Feature flag implementation
- 🌍 **Internationalization** - Multi-language support
- 📱 **Platform Specific** - iOS/Android specific optimizations

## 👨‍💻 Developer Information

**Name:** Ali Hassan  
**GitHub:** [@alihrhera](https://github.com/alihrhera)  
**Project:** Flutter Users Management App  
**Purpose:** Technical Assessment - Clean Architecture Demo

## 📄 License

This project is developed for educational and assessment purposes. It follows standard open-source practices and can be used as a reference for Flutter development best practices.
