# SwiftUI MVVM JSON Decoder Project

Welcome to the SwiftUI MVVM JSON Decoder Project! This project demonstrates how to use SwiftUI with the MVVM architectural pattern to decode JSON data from a file.

## Features

- SwiftUI for building the user interface
- MVVM (Model-View-ViewModel) architecture for separation of concerns and better code maintainability
- JSON decoding using Swift's `Codable` protocol
- Sample JSON file included in the project

## Requirements

- Xcode 12 or later
- iOS 14.0 or later

## Usage

- Open ContentView.swift to see the main SwiftUI view.
- Open ViewModel.swift to see the ViewModel implementation.
- Open Model.swift to see the data model and JSON decoding logic.
- Open data.json to see the sample JSON file.


## Project Structure

- ContentView.swift: The main SwiftUI view that displays data.
- ViewModel.swift: The ViewModel that handles business logic and data processing.
- Model.swift: The data model that conforms to Codable for JSON decoding.
- data.json: The sample JSON file used in the project.

## JSON Decoding

The project includes a sample JSON file (data.json) that is decoded into Swift objects using the Codable protocol. The ViewModel handles the decoding process and provides the data to the SwiftUI view.

## Example JSON
Here's an example of what the data.json file looks like:

```
[
    {
        "id": 1,
        "name": "Item 1",
        "description": "This is the first item."
    },
    {
        "id": 2,
        "name": "Item 2",
        "description": "This is the second item."
    }
]
```

# Decoding Process
The JSON data is decoded into a Model object using the JSONDecoder class:

```
struct Item: Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
}

class ViewModel: ObservableObject {
    @Published var items: [Item] = []
    
    init() {
        loadJSON()
    }
    
    func loadJSON() {
        if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Item].self, from: data)
                self.items = jsonData
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
}
```

# Acknowledgements

- SwiftUI
- MVVM Architecture
- JSON Decoding
