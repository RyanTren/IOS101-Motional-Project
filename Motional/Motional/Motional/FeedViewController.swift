//
//  FeedViewController.swift
//  Motional
//
//  Created by Ryan on 11/18/23.
//

import Foundation
import UIKit

class FeedViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Add property to store fetched exercises array
    private var exercises: [Exercise] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseCell

        let exercise = exercises[indexPath.row]

        // Configure the cell
        cell.nameLabel.text = exercise.name
        cell.instructionsLabel.text = exercise.description

        // Add any additional configuration needed for ExerciseCell

        return cell
    }

    func fetchExercises() {
        let apiUrl = "https://api.api-ninjas.com/v1/exercises?muscle="
        
        // You can specify the muscle you're interested in, for example, "legs"
        let muscleType = "legs"
        
        if let url = URL(string: apiUrl + muscleType) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let exerciseFeed = try JSONDecoder().decode(ExerciseFeed.self, from: data)
                        let exercises = exerciseFeed.results
                        
                        // Update the UI on the main thread
                        DispatchQueue.main.async { [weak self] in
                            self?.exercises = exercises
                            self?.tableView.reloadData()
                        }
                        
                    } catch {
                        print("Error decoding exercises: \(error)")
                    }
                }
            }.resume()
        }
    }

    // Example usage of saving and retrieving favorite exercises
//    let favoriteExercises = [Exercise(name: "Squats", description: "Lower body workout", category: "Strength", muscle: "Legs", equipment: "Barbell")]
//    Exercise.save(favoriteExercises, forKey: Exercise.favoritesKey)
//    let retrievedExercises = Exercise.getExercises(forKey: Exercise.favoritesKey)
//    print(retrievedExercises)
}
