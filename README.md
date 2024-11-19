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

## ⚠️ Note
- Firebase keys and configuration have been removed for security reasons. Please add your own Firebase credentials.
