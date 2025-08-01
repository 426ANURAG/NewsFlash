# NewsFlash

NewsFlash is an iOS application built with the **VIPER architecture**. It displays a list of **New York Times Most Popular Articles** and allows users to tap on any article to view detailed information.

---

## Features

- **VIPER architecture** for clean separation of concerns and testability  
- Uses **Swift Concurrency** (async/await) for network calls and asynchronous operations  
- Displays a scrollable list of NY Times most popular articles  
- Article detail screen showing full content on tap  
- Modular networking using a separate **NewsFlashNetworking** Swift Package  
- Unit tests covering VIPER components and networking layer  

---

## Architecture

The project follows the VIPER design pattern with the following modules:

- **View**: SwiftUI-based UI for the article list and detail screens  
- **Interactor**: Handles business logic and async data fetching using Swift concurrency  
- **Presenter**: Mediates between view and interactor, formats data for display  
- **Entity**: Data models representing articles and API responses  
- **Router**: Manages navigation between screens  

---

## Networking

Networking is handled by the **NewsFlashNetworking** Swift Package, hosted separately on GitHub:

- Provides shared network manager with reusable API request logic  
- Includes built-in **reachability** support for network status monitoring  
- Fully tested with unit test cases  
- Easy to integrate as a Swift Package Manager dependency  

---

## Installation

### Clone the repository

```bash
git clone https://github.com/yourusername/NewsFlash.git
cd NewsFlash
```

## Usage
Open in Xcode
Open NewsFlash.xcodeproj or .xcworkspace

The NewsFlashNetworking package is linked via Swift Package Manager


- Launch the app
- Browse the list of most popular NY Times articles
- Tap on any article to see detailed information

## Testing
Unit tests are written for all VIPER components:

- Interactors
- Presenters
- ViewModels

Networking package includes its own test suite

Contributing
Feel free to fork this project and submit pull requests. For major changes, please open an issue first.

License
This project is licensed under the MIT License. See the LICENSE file for details.

Contact
Created by [Anurag Sharma] - feel free to reach out!
