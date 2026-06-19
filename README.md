# Weather App 🌤️

A beautifully designed Flutter weather application showcasing modern mobile development practices, state management, and clean architecture patterns.

## 🎯 Overview

This weather app provides real-time weather information with a 3-day forecast, hourly updates, and location-based weather data. It demonstrates professional Flutter development techniques including BLoC pattern implementation, reactive programming, and custom UI components.

## ✨ Features

- 🌍 **Location-based Weather**: Search weather by city name
- 📊 **Current Weather Display**: Temperature, conditions, UV index, sunrise/sunset times
- 📅 **7-Day Forecast**: Extended weather predictions with temperature ranges
- ⏰ **Hourly Forecast**: 4-hour detailed weather breakdown
- 🎨 **Beautiful UI**: Custom gradient designs with smooth animations
- 📱 **Responsive Design**: Optimized for various screen sizes
- ⚡ **Smooth Scrolling**: Animated horizontal day/hour scroller with navigation

## 🏗️ Architecture

### Clean Architecture Pattern
```
lib/
├── pages/          # Screen/page widgets (presentation layer)
├── widgets/        # Reusable UI components
├── cubit/          # BLoC state management (business logic layer)
├── models/         # Data models (data layer)
├── service/        # API service layer
├── helper/         # Utility functions
└── constance/      # Constants & themes
```

### Data Flow
```
UI (Pages) → BLoC (GetWeatherCubit) → Service (WeatherServic) → API
     ↑                                                            ↓
     └─────────────────── State & Data Models ──────────────────┘
```

## 🔧 Design Patterns & Technologies

### State Management: **BLoC Pattern**
- **GetWeatherCubit**: Central state manager handling weather data fetching
- **GetWeatherState**: Sealed class defining 3 distinct states:
  - `GetWeatherCubitInitial` - Initial state
  - `WeatherLoadedState` - Data successfully loaded
  - `WeatherFailureState` - Error occurred

```dart
// Usage in UI
BlocBuilder<GetWeatherCubit, GetWeatherState>(
  builder: (context, state) {
    if (state is WeatherLoadedState) {
      return DisplayWeather(weatherModel: state.weatherModel);
    }
  },
)
```

### Data Models: **Factory Pattern**
- `WeatherModel.fromJson()`: Transforms API JSON into typed Dart objects
- Nested models: `HourModel`, `DayModel` for structured data
- Data extraction logic: Filters first 4 hours and 3 days from API response

### Service Layer: **Singleton Pattern**
- `WeatherServic`: Encapsulates API communication
- Uses **Dio** HTTP client for request handling
- Centralized error handling with custom exception messages
- API: [WeatherAPI.com](https://www.weatherapi.com/)

### UI Components: **Composition Pattern**
- `DaysScroller`: Animated horizontal list with scroll controls
- `One_Day_Widget`: Reusable day forecast card
- `Today_Widget`: Current weather display
- `Custom_Text`: Typography helper widget
- **Scroll Animation**: 300ms easing curves for smooth UX

## 📦 Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_bloc` | ^9.1.1 | State management |
| `bloc` | ^9.1.0 | BLoC pattern core |
| `dio` | ^5.9.0 | HTTP client |
| `google_fonts` | ^6.3.2 | Custom typography |
| `intl` | ^0.20.2 | Date/time localization |
| `flutter_launcher_icons` | ^0.14.4 | App icon generation |

## 🎨 Custom Design Elements

### Gradient Background
```dart
gradient: LinearGradient(
  colors: colorsOfPage,  // [#1B2444, #443A8C, #8A3EA0]
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
)
```

### Font System
- **Poppins** custom font family with weights: 400 (Regular), 500 (Medium), 700 (Bold)
- Consistent typography across all screens

### Navigation Routes
```dart
'/get_start_page'   → Welcome screen
'/today_page'       → Current weather
'/forecast_page'    → Extended forecast
'/set_location'     → Location selection
```

## 🔌 API Integration

### Weather Service Flow
```dart
GetWeatherCubit.getWeather(cityName)
    ↓
WeatherServic.getCurrentWeather()
    ↓
GET /forecast.json?key=API_KEY&q=cityName&days=3
    ↓
WeatherModel.fromJson(response.data)
    ↓
emit(WeatherLoadedState)
```

- **Endpoint**: `http://api.weatherapi.com/v1/forecast.json`
- **Data Fetching**: 3-day forecast with hourly breakdown
- **Error Handling**: Graceful failure states with user messages

## 🚀 Building & Running

### Prerequisites
- Flutter SDK 3.8.1+
- Dart 3.8.1+

### Setup
```bash
# Clone the project
git clone <repository-url>
cd weather_app_figma

# Install dependencies
flutter pub get

# Generate app icons (optional)
flutter pub run flutter_launcher_icons:main

# Run the app
flutter run
```

### Build Release
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## 💡 Key Implementation Highlights

### 1. Reactive State Updates
- UI automatically rebuilds when weather data changes
- No manual setState() calls
- Separation of concerns between UI and logic

### 2. Custom Scroll Animation
```dart
_scrollController.animateTo(
  offset + 77,  // Dynamic scroll amount
  duration: Duration(milliseconds: 300),
  curve: Curves.easeInOut,
)
```

### 3. Reusable Widget Patterns
- `One_Day_Widget`: Accepts data parameters for flexibility
- `DaysScroller`: Manages internal scroll state, exposes minimal API
- Stateful components only when necessary

### 4. Type Safety
- Sealed classes for exhaustive state checking
- Strongly typed models preventing runtime errors
- Factory constructors for safe JSON deserialization

## 📋 Project Structure Highlights

| File | Purpose |
|------|---------|
| `main.dart` | App entry, BLoC provider setup, route definitions |
| `get_weather_cubit.dart` | Central business logic for weather fetching |
| `get_weather_state.dart` | Sealed state definitions |
| `Weather_Model.dart` | Data model with JSON factory |
| `weather_Service.dart` | API communication layer |
| `Day_Scroller_Forcast.dart` | Animated horizontal scroller |
| `ProjectConstanc.dart` | Colors, images, theme constants |

## 🎓 Skills Demonstrated

✅ **State Management**: BLoC/Cubit pattern implementation  
✅ **Architecture**: Clean separation of concerns  
✅ **Async Programming**: Future-based async/await  
✅ **API Integration**: HTTP client setup and error handling  
✅ **UI/UX**: Custom animations, gradients, responsive design  
✅ **Type Safety**: Sealed classes, factory patterns, null safety  
✅ **Widget Composition**: Building complex UIs from reusable components  
✅ **Navigation**: Named routes with BLoC integration  

## 📱 Screenshots

- **Offline Cached Dashboard**: Launches instantly with locally cached weather data for offline access
<img src="assets/Screenshots/Offline Cached Dashboard.jpeg" width="300">
- **Search Page**: Global search interface to look up any city's weather.
<img src="assets/Screenshots/search page.jpeg" width="300">
- **Autocomplete Search**: Smart typeahead feature predicting city names in real time as you type
<img src="assets/Screenshots/Autocomplete search.jpeg" width="300">
- **Dynamic Search Results View**: Detailed display showing 7-day forecasts, AQI, and UV index upon city selection.
<img src="assets/Screenshots/Dynamic Search Results View.jpeg" width="300">
- **Get Start Location Page**: Onboarding screen guiding users to set their default city.
<img src="assets/Screenshots/get start location  page.jpeg" width="300">
- **Dynamic Search Results View**: GPS prompt to automatically detect and display local weather data.
<img src="assets/Screenshots/location permission.jpeg" width="300">


## 🔐 Security Notes

- API key stored in code (for demo purposes only)
- ⚠️ **Production**: Move API keys to environment variables or secure storage

## 📈 Future Enhancements

- [ ] Dark/Light theme toggle
- [ ] Favorite locations management
- [ ] Push notifications for weather alerts
- [ ] Offline data caching
- [ ] Unit/Widget tests coverage
- [ ] Weather alerts and severe warnings
- [ ] Air quality index (AQI) display

## 📝 License

This project is open source and available under the MIT License.

---

**Author**: Flutter Developer  
**Created**: 2025  
**Flutter Version**: 3.8.1+
