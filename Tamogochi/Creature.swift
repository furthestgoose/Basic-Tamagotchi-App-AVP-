//
//  Creature.swift
//  Tamogochi
//
//  Created by Adam Byford on 30/05/2024.
//

import Foundation

struct Creature: Identifiable {
    var name: String
    var modelName: String
    var hungerLevel: Int
    var happiness: Int
    var age: Int
    var id = UUID()
}

