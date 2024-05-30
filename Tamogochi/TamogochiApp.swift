//
//  TamogochiApp.swift
//  Tamogochi
//
//  Created by Adam Byford on 30/05/2024.
//

import SwiftUI

@main
struct TamogochiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowResizability(.contentSize)
        .defaultSize(width: 0.75, height: 0.5, depth: 0.5, in: .meters)
        WindowGroup(id: "creatureWindow", for: String.self) { $modelName in
            CreatureDetailView(modelName: modelName ?? "")
                .padding3D([.back, .top], 250)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.5, height: 0.5, depth: 0.5, in: .meters)
    }
}
