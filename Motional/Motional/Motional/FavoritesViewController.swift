//
//  FavoritesViewController.swift
//  Motional
//
//  Created by Ryan on 11/20/23.
//

import Foundation
import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyFavoritesLabel: UILabel!

    var favoriteExercise: [Exercise] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Anything in the defer call is guaranteed to happen last
        defer {
            // Show the "Empty Favorites" label if there are no favorite movies
            emptyFavoritesLabel.isHidden = !favoriteExercise.isEmpty
        }

        // TODO: Get favorite movies and display in table view

        let exercises = Exercise.getExercises(forKey: Exercise.favoritesKey)
        self.favoriteExercise = exercises
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteExercise.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseCell

        // Get the movie associated table view row
        let exercise = favoriteExercise[indexPath.row]

        // Configure the cell (i.e. update UI elements like labels, image views, etc.)


        // Set the text on the labels
        cell.nameLabel.text = exercise.name

        // Return the cell for use in the respective table view row
        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // MARK: - Pass the selected movie to the Detail View Controller

        // Get the index path for the selected row.
        // `indexPathForSelectedRow` returns an optional `indexPath`, so we'll unwrap it with a guard.
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }

        // Get the selected movie from the movies array using the selected index path's row
        let selectedExercise = favoriteExercise[selectedIndexPath.row]

        // Get access to the detail view controller via the segue's destination. (guard to unwrap the optional)
        guard let detailViewController = segue.destination as? DetailViewController else { return }

        //DetailViewController.exercise = selectedExercise
    }
}
