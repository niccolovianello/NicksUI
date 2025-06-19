# NicksUI 📱

**NicksUI** is a Swift Package providing reusable and composable SwiftUI components for iOS applications. It’s designed with clarity, modularity, and modern SwiftUI conventions in mind, targeting **iOS 17+**.

## 📦 Features

- Ready-to-use SwiftUI views and controls
- Modular structure for easy integration
- Clean, testable architecture
- Swift concurrency-ready
- iOS 17 exclusive features like `Observable` and `#Preview`

## 🛠 Installation

### Using Xcode

1. Go to **File > Add Packages...**
2. Enter the repository URL: https://github.com/niccolovianello/NicksUI.git
3. Choose the latest version and add the `NicksUI` package to your target.

### Using `Package.swift`

```swift
dependencies: [
 .package(url: "https://github.com/niccolovianello/NicksUI.git", from: "1.0.0")
]
```

Then import it in your files:
```swift
import NicksUI
```

📁 Structure
- Sources/NicksUI/: Main source files for reusable components
- Tests/NicksUITests/: Unit tests for the package

✅ Requirements
- iOS 17+
- Swift 5.9+
- Xcode 15+
