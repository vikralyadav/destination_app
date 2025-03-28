# Destination App

A Flutter application that fetches and displays destination data using the BLoC pattern.

## Features

- Fetches destination data from a remote API.
- Implements state management using the `flutter_bloc` package.
- Displays loading, loaded, and error states.

## Project Structure
lib/ ├── presentation/ │ ├── bloc/ │ │ ├── destination_bloc.dart │ │ ├── destination_event.dart │ │ ├── destination_state.dart

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Dart 2.17.0 or later

### Installation

1. Clone the repository:
   ```sh
   git clone <repository-url>



   API Reference
This app fetches data from the<vscode_annotation details='%5B%7B%22title%22%3A%22hardcoded-credentials%22%2C%22description%22%3A%22Embedding%20credentials%20in%20source%20code%20risks%20unauthorized%20access%22%7D%5D'> following</vscode_annotation> API:

Endpoint: https://dummyjson.com/products
Response: A list of products.
State Management
This project uses the BLoC pattern for state management. The main BLoC file is DestinationBloc, which handles the following states: