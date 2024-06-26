# Tamagotchi SwiftUI App

A virtual pet application built using SwiftUI and RealityKit, where users can select and interact with different pets. This project includes basic functionality for feeding and playing with pets, as well as tracking their happiness, hunger, and age over time.

## Features

- **Multiple Pets**: Choose from a variety of pets including a bird, dog, and fish.
- **Real-time Updates**: Pets' attributes such as happiness, hunger, and age are updated in real-time.
- **Interactive UI**: Simple and intuitive user interface for interacting with pets.
- **Death Scenarios**: Pets can die due to old age, starvation, or depression, with a display showing the reason and age at death.

## Getting Started

### Prerequisites

- Xcode 12 or later
- iOS 14.0 or later

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/furthestgoose/Basic-Tamagotchi-App-AVP-.git
    ```
2. Open the project in Xcode:
    ```sh
    cd tamagotchi-swiftui-app
    open Tamagotchi.xcodeproj
    ```
3. Build and run the app on a simulator or a physical device.

### Usage

1. Launch the app.
2. Select a pet from the list to start interacting with it.
3. Use the "Feed" and "Play" buttons to maintain your pet's happiness and hunger levels.
4. Monitor your pet's attributes (happiness, hunger, and age) in real-time.
5. If the pet dies, the reason and age at death will be displayed.

## Screenshots
overview example:
![overview example](https://github.com/furthestgoose/Basic-Tamagotchi-App-AVP-/assets/77462614/c0e2d6bc-db41-42a3-bb49-04244399d724)
pop out view example:
![pop out view example](https://github.com/furthestgoose/Basic-Tamagotchi-App-AVP-/assets/77462614/3634d09b-1db2-460f-bc70-d2ded049e183)
death example:
![death example](https://github.com/furthestgoose/Basic-Tamagotchi-App-AVP-/assets/77462614/df4a2d83-d5cd-4cca-8829-33b36d3f907e)
App Icon:
![app icon](https://github.com/furthestgoose/Basic-Tamagotchi-App-AVP-/assets/77462614/13f8fd29-b259-4bfe-b1b4-97dd12403815)

## Code Structure

- `ContentView.swift`: The main view of the app, containing the user interface and logic for interacting with pets.
- `Creature.swift`: A model representing a creature with attributes such as name, modelName, hungerLevel, happiness, and age.
- `CreatureDetailView.swift`: Contains the model view for the pop out view of the pet.

## License

This project is licensed under the GPL V3 License - see the [LICENSE](https://github.com/furthestgoose/Basic-Tamagotchi-App-AVP-/blob/master/LICENSE) file for details.

## Acknowledgments

- SwiftUI and RealityKit documentation


