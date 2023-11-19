//
//  Exercise.swift
//  Motional
//
//  Created by Ryan on 11/18/23.
//

import Foundation

struct ExerciseFeed: Decodable {
    let results: [Exercise]
}

struct Exercise: Codable, Equatable {
    let name: String
    let instructions: String
    let type: String

    // Additional properties specific to exercises
    let muscle: String
    let equipment: String
    let difficulty: String

    // Custom coding keys for mapping
    enum CodingKeys: String, CodingKey {
        case name
        case instructions
        case type
        case muscle
        case equipment
        case difficulty
    }
}

// Additional functionality for Exercise struct
extension Exercise {
    static var favoritesKey: String {
        return "ExerciseFavorites"
    }

    static func save(_ exercises: [Exercise], forKey key: String) {
        let defaults = UserDefaults.standard
        let encodedData = try! JSONEncoder().encode(exercises)
        defaults.set(encodedData, forKey: key)
    }

    static func getExercises(forKey key: String) -> [Exercise] {
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: key) {
            let decodedExercises = try! JSONDecoder().decode([Exercise].self, from: data)
            return decodedExercises
        } else {
            return []
        }
    }
}

