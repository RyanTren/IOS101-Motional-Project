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

struct Exercise: Decodable {
    let name, type, muscle, equipment, difficulty, instructions: String

    enum CodingKeys: String, CodingKey {
        case name, type, muscle, equipment, difficulty, instructions
    }
}
