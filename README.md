# Bookly

Bookly is an e-commerce bookstore app built with Flutter and Dart. The app leverages Clean Architecture, dependency injection, and Bloc for state management to ensure a scalable and maintainable codebase.

## Features

- Search for books.
- View detailed information about books.

## Technologies Used

- **Flutter Framework**: For building the UI.
- **Dart Programming Language**: For app development.
- **Clean Architecture**: For a scalable and maintainable code structure.
- **Dependency Injection**: To manage dependencies efficiently.
- **Bloc (State Management)**: To manage app states and ensure a predictable state management pattern.
- **Dio Package**: For making HTTP requests and handling API calls.

## Screenshots

## Getting Started

### Prerequisites

Ensure you have the following installed:

- Flutter SDK: Install Flutter
- Dart SDK: Included with Flutter
- An IDE or text editor: [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/)

### Installation

1. Clone the repository:
   
   ```shell
   git clone https://github.com/yourusername/bookly.git cd bookly
   ```

2. Install dependencies:
   
   ```shell
   flutter pub get
   ```

3. Run the app:
   
   ```shell
   flutter run
   ```

## Project Structure

The project follows Clean Architecture principles, separating the code into different layers:

- **Presentation**: Contains UI code and state management (Bloc).
- **Domain**: Contains business logic and entities.
- **Data**: Handles data fetching from APIs and local databases.

## Dependencies

The project uses the following dependencies:

- `flutter_bloc`: For state management.
- `dio`: For handling HTTP requests.
- `get_it`: For dependency injection.
- `carousel_slider`: For making Featured Books Slider.
- `go_router`: For routing and navigation.
- `url_launcher`: for launch extended URLs.
- `cahced_network_image`: for caching images.
- `hive` and `hive_flutter`: for caching data.
- `dartz`: For functional programming constructs such as Option, Either, and more.