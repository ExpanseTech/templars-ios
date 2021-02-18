# Templars

This library is a simple integration of [Templars](https://templars.netlify.app/) for iOS applications.

## Installation

To integrate Templars into your Xcode project, use Swift Package Manager:

You may use Xcode. Navigate to File->Swift Packages->Add Package Dependency. Then put the link to the repository.

```text
https://github.com/ExpanseTech/templars-ios
```

Or add Templars to the dependencies value of your Package.swift file.
```swift
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    dependencies: [
        .package(url: "https://github.com/ExpanseTech/templars-ios"),
    ]
)
```

## Usage
Add the line below in your app's ```build.gradle```
```kotlin
let templars = Templars(apiKey: "<API_key>")

templer.getDocuments(page: 1, pageSize: 10, sortBy: .dateAccending)
            .sink { (error) in
                print(error)
            } receiveValue: { (documentData) in
                self.documents = documentData.data
            }.store(in: &cancelables)
```


## License
[MIT](https://choosealicense.com/licenses/mit/)

