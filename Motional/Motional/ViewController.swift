<<<<<<< HEAD
<<<<<<< HEAD
// ExerciseListViewController.swift
import UIKit

class ExerciseListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var exercises: [Exercise] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchExercises()
    }

    func fetchExercises() {
        guard let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle=") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let decoder = JSONDecoder()
                let fetchedExercises = try decoder.decode([Exercise].self, from: data)
                self?.exercises = fetchedExercises

                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }

        task.resume()
    }

    // MARK: - UITableViewDataSource Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseTableViewCell
        let exercise = exercises[indexPath.row]
        cell.configure(with: exercise)
        return cell
    }

    // MARK: - UITableViewDelegate Methods

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Handle row selection, e.g., navigate to a detail view
=======
//
//  ViewController.swift
//  Motional
//
//  Created by Ryan on 11/7/23.
//

import UIKit

=======
//
//  ViewController.swift
//  Motional
//
//  Created by Ryan on 11/7/23.
//

import UIKit

>>>>>>> parent of 0a9ddcf (Added Contents)
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
<<<<<<< HEAD
>>>>>>> parent of 0a9ddcf (Added Contents)
=======
>>>>>>> parent of 0a9ddcf (Added Contents)
    }


}

