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
![splash_screen](https://github.com/AhmedEl-Shamy/Bookly/assets/100457739/f4ec9882-a976-488c-8c9a-3567acc71cc3)
###
![home](https://github.com/AhmedEl-Shamy/Bookly/assets/100457739/38155b50-e1b7-4bb7-be03-79c7e75be24c)
###
![book_details](https://github.com/AhmedEl-Shamy/Bookly/assets/100457739/37c82fe5-2369-4062-a0a7-e7c037807632)
###
![search](https://github.com/AhmedEl-Shamy/Bookly/assets/100457739/dd1bde86-7ea0-4274-bf59-d9015fe96131)

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
