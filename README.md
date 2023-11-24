# iOS Practical Test - Clean Code Architecture with Moya Integration

This Swift project serves as a practical demonstration of a clean code architecture, with a focus on modularization and the integration of API calls using the Moya plugin.

## API Used
The project utilizes the following API for demonstration purposes: [Dummy JSON](https://dummyjson.com/posts)

## Project Structure

### 1. **Services**
   - This module contains services responsible for handling REST calls using the Moya library. It ensures a clean and modular approach to API integration.

### 2. **Views**
   - The Views module encapsulates common UI components, ensuring consistency in the app's appearance. It promotes reusability and maintainability.

### 3. **Controllers**
   - The Controllers module houses the logical components of the screens. Each screen's functionality is organized in a clean and modular manner, following best practices for maintainability and testability.

### 4. **Storyboards**
   - Storyboard files are organized in this module, providing a visual representation of the app's flow. It enhances the separation of concerns by keeping UI-related tasks distinct from the business logic.

## Usage
1. Clone the repository.
2. Open the project in Xcode.
3. Build and run the project on your iOS simulator or device.

## Dependencies
- **Moya**: Used for simplified and efficient network requests. The integration with Moya enhances the project's readability and maintainability.
