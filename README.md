# Infinite Numbers Grid Application

## Overview
This Flutter application displays an infinitely scrollable grid of numbers organized into 10 columns with unlimited rows. It provides interactive highlighting of numbers based on prime identification and common divisors.

---

## Features
- **Infinite Scroll Grid:** Efficiently loads an infinite grid with 10 columns.
- **Prime Number Highlighting:** Prime numbers have a **red background** and **white text**.
- **Interactive Divisor Highlighting:** When tapping a number, numbers sharing a common divisor with the tapped number are highlighted in **blue background** with **white text**.
- **Real-Time Interaction:** Highlights appear while pressing and revert instantly upon release.

---

## Tech Stack
- **Flutter & Dart**
- **Riverpod (State Management)**

---

## Application Structure

### main.dart
- Initializes the Flutter application wrapped in a `ProviderScope` for Riverpod state management.
- Defines the application theme and dark theme.

### InfiniteNumbersScreen
- Contains a `GridView.builder` for infinite scrolling.
- Manages user interactions, highlighting logic, and prime identification.

### NumberProvider (Riverpod)
- Manages state using `StateNotifierProvider` for efficient reactivity.
- Handles logic for prime number checks, GCD calculation, and number selection states.

---

## Logic and Implementation Details

### 1. Prime Number Check (`isPrime`)
- Uses efficient caching (`primeCache`) to avoid recalculating prime status.
- Complexity: O(√n) with caching.

### 2. Greatest Common Divisor (`gcd`)
- Implements Euclidean algorithm for efficient common divisor calculation.
- Complexity: O(log n)

### 3. Number Highlighting Logic
- Prime numbers: Red background with white text.
- Common divisors: Blue background with white text (while pressed).
- Default numbers: White background with black text.

### 4. Interactive UX
- Uses Flutter's GestureDetector (`onTapDown`, `onTapUp`, `onTapCancel`) for immediate feedback.
- Animated highlighting with smooth transitions using AnimatedContainer.

---

## Performance Considerations
- Efficient infinite scrolling (`GridView.builder`) loads only visible grid cells.
- Cached prime and divisor computations significantly enhance performance.
- Optimized interaction logic ensures smooth real-time responsiveness.

---

## How to Run
1. Clone the repository.
2. Ensure Flutter and Dart SDK are installed.
3. Navigate to the project directory:
```bash
flutter pub get
flutter run
```

---

## Future Improvements
- Further optimization for large numbers using isolates.
- Enhanced UI customization (themes, fonts, animations).

---

## License
This project is open-source under the MIT License.

---

## Author
Developed by [noy korleker].

---

