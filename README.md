# Restaurant App

**App for browsing and ordering food from restaurants**

This Flutter application provides a user-friendly interface for browsing restaurant menus and placing orders, with secure OTP-based login and map point selection for delivery.

## 📋 Features
- **OTP Verification**: Secure login using Firebase OTP.
- **Product Loading**: Fetch and display restaurant products dynamically via a custom-built API.
- **Map Point Selection**: Select a delivery point on a map with geocoding.

## 🛠️ Technologies
- **Firebase**: OTP verification and Firestore database for user authentication and data storage.
- **Dio**: HTTP client for making efficient API requests.
- **OSM & Geocoding**: Map integration and delivery point selection using `flutter_osm_plugin` and `geocoding`.
- **FastAPI**: Backend built with FastAPI for managing restaurant data and orders.
- **Hive**: Lightweight database for caching and offline access.
- **BLoc**: State management using `flutter_bloc`.
- **Dartz**: Functional programming utilities in Dart.
- **Equatable**: Simplifies value equality in Dart classes.
- **Pinput**: For customizing OTP input fields.
- **Cached Network Image**: Efficient loading and caching of images.
- **GetIt**: Service locator for dependency injection.

## 🎥 Demo
https://github.com/artemhula/restaurant_app/assets/66064927/6c068439-894a-4115-944e-f07a448f75c9

## 🗂️ Project Structure
The project is structured according to best practices for scalability and maintainability:

- **lib/common**: Contains common widgets and theme configurations.
- **lib/core**: Handles errors and failure management.
- **lib/features/auth**: Handles all authentication-related logic, including OTP verification.
  - `data`: Firebase, Firestore, and local data sources for user authentication.
  - `domain`: User entities and use cases for authentication.
  - `presentation`: User interface components related to login and OTP.
- **lib/features/cart**: Manages the shopping cart functionality.
  - `data`: Data sources for order management.
  - `domain`: Order entities and use cases.
  - `presentation`: UI components for the cart and order screens.
- **lib/features/menu**: Handles product fetching and menu display.
  - `data`: Remote data sources for fetching product info.
  - `domain`: Product entities and use cases for product management.
  - `presentation`: UI components for product listing.
- **lib/utils**: Utility functions and configuration files.

## ⚠️ Note
- Firebase keys and configuration have been removed for security reasons. Please add your own Firebase credentials.
