import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openWindow) private var openWindow
    @State private var selectedCreature: Creature?
    @State private var timer: Timer?
    private let updateInterval: TimeInterval = 3600

    @State private var creatures = [
        Creature(name: "Bird", modelName: "BirdScene", hungerLevel: 0, happiness: 100, age: 0),
        Creature(name: "Dog", modelName: "DogScene", hungerLevel: 0, happiness: 100, age: 0),
        Creature(name: "Fish", modelName: "FishScene", hungerLevel: 0, happiness: 100, age: 0)
    ]

    @State private var deathReason: String?
    @State private var ageAtDeath: Int?

    var body: some View {
        NavigationSplitView {
            List(creatures) { creature in
                Button(action: {
                    selectedCreature = creature
                    deathReason = nil
                    ageAtDeath = nil
                    startTimer()
                }, label: {
                    Text(creature.name)
                })
            }
            .navigationTitle("Different Pets")
        } detail: {
            if let selectedCreature = selectedCreature {
                VStack {
                    if let deathReason = deathReason, let ageAtDeath = ageAtDeath {
                        Model3D(named: "DeathScene", bundle: realityKitContentBundle)
                            .navigationTitle(selectedCreature.name)
                            .toolbar {
                                Text("Died at age: \(ageAtDeath)")
                                Text("Reason: \(deathReason)")
                            }
                    } else {
                        Model3D(named: selectedCreature.modelName, bundle: realityKitContentBundle)
                            .navigationTitle(selectedCreature.name)
                            .toolbar {
                                Text("Happiness: \(selectedCreature.happiness)/100")
                                Text("Hunger: \(selectedCreature.hungerLevel)/100")
                                Text("Age: \(selectedCreature.age)")
                                Button(action: {
                                    openWindow(id: "creatureWindow", value: selectedCreature.modelName)
                                }, label: {
                                    Text("View \(selectedCreature.name)")
                                })
                            }
                                HStack {
                                    Button(action: {
                                        feedCreature()
                                    }, label: {
                                        Text("Feed")
                                    })
                                    Button(action: {
                                        playWithCreature()
                                    }, label: {
                                        Text("Play with \(selectedCreature.name)")
                                    })
                                }
                                .padding()
                    }
                }
            } else {
                Text("Select a pet")
            }
        }
        .frame(minWidth: 700, minHeight: 700)
    }

    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: updateInterval, repeats: true) { _ in
            updateCreatureData()
        }
    }

    private func updateCreatureData() {
        guard let index = creatures.firstIndex(where: { $0.id == selectedCreature?.id }) else { return }
        
        creatures[index].hungerLevel = min(creatures[index].hungerLevel + 2, 100)
        creatures[index].happiness = max(creatures[index].happiness - 2, 0)
        creatures[index].age += 1
        
        if creatures[index].age >= 100 {
            deathReason = "Old Age"
            ageAtDeath = creatures[index].age
            stopTimer()
        } else if creatures[index].hungerLevel >= 100 {
            deathReason = "Starvation"
            ageAtDeath = creatures[index].age
            stopTimer()
        } else if creatures[index].happiness <= 0 {
            deathReason = "Depression"
            ageAtDeath = creatures[index].age
            stopTimer()
        }

        selectedCreature = creatures[index]
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func feedCreature() {
        guard let index = creatures.firstIndex(where: { $0.id == selectedCreature?.id }) else { return }
        creatures[index].hungerLevel = max(creatures[index].hungerLevel - 10, 0)
        selectedCreature = creatures[index]
    }

    private func playWithCreature() {
        guard let index = creatures.firstIndex(where: { $0.id == selectedCreature?.id }) else { return }
        creatures[index].happiness = min(creatures[index].happiness + 10, 100)
        selectedCreature = creatures[index]
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

