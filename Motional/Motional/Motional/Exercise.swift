import Foundation

//struct ExerciseFeed: Decodable {
//    let exercises: [Exercise]
//}

struct Exercise: Codable, Equatable {
    let name: String
    let type: String
    let muscle: String
    let equipment: String
    let difficulty: String
    let instructions: String

    // Add CodingKeys to map the properties to JSON keys
    enum CodingKeys: String, CodingKey {
        case name
        case type
        case muscle
        case equipment
        case difficulty
        case instructions
    }
}

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
