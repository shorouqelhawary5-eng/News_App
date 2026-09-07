# News App

A Flutter application for fetching and displaying real-time news articles using the NewsAPI.org REST API. Built with Provider for state management and structured around the Repository Pattern.

## Features
- **Category Views:** Switch between news categories (General, Sports, Health, Technology) within a single unified view.
- **Source Filtering:** Dynamic tab bar filtering to browse articles by specific publishers.
- **Article Details & In-App Web View:** Tapping an article opens a bottom sheet with its image and summary, including an in-app browser option (`url_launcher`) to view the full web article without leaving the app state.
- **Search with Pagination:** Paginated search queries to handle large article lists efficiently.
- **Localization & Themes:** Supports Light/Dark modes and English/Arabic localizations.
- **Error Handling:** Handles network connection loss and API errors with appropriate UI state indications.

## Tech Stack & Architecture
- **Framework:** Flutter & Dart
- **State Management:** Provider
- **Design Pattern:** Repository Pattern
- **Networking:** HTTP package & REST APIs
- **In-App Web Navigation:**  Url Launcher
- **Localization:** Flutter Localizations
