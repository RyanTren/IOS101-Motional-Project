//  FeedViewController.swift

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var exercises: [Exercise] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true

        tableView?.dataSource = self
        fetchExercises()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseCell
        let exercise = exercises[indexPath.row]

      

        cell.nameLabel.text = exercise.name
        
        return cell
    }
    
    // In FeedViewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedExercise = exercises[indexPath.row]
        print("Selected Exercise in FeedViewController: \(selectedExercise)")
        
        performSegue(withIdentifier: "ExerciseDetailSegue", sender: self)
    }


//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedExercise = exercises[indexPath.row]
//        print("Selected Exercise in FeedViewController: \(selectedExercise)")
//
//        // Instantiate DetailViewController from storyboard
//        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
//            // Set the exercise property
//            detailVC.exercise = selectedExercise
//
//            // Push the DetailViewController onto the navigation stack
//            navigationController?.pushViewController(detailVC, animated: true)
//        }
//    }

    // Inside FeedViewController

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ExerciseDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedExercise = exercises[indexPath.row]
                print("Sender Exercise in prepare(for segue:sender:): \(selectedExercise)")
                
                if let destinationVC = segue.destination as? DetailViewController {
                    destinationVC.exercise = selectedExercise
                }
            }
        }
    }



    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        guard segue.identifier == "ExerciseDetailSegue",
    //              let indexPath = tableView.indexPathForSelectedRow else {
    //            return
    //        }
    //
    //        let selectedExercise = exercises[indexPath.row]
    //
    //        if let destinationVC = segue.destination as? DetailViewController {
    //            destinationVC.exercise = selectedExercise
    //        }
    //    }

    private func fetchExercises() {
        guard let apiUrl = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle=chest") else {
            print("Invalid API URL")
            return
        }

        // Replace "Your-API-Key" with your actual API key
        let apiKey = "2UWlXCA5qrTw12FiCTmXIw==8EyVf8NrBbeC6YMm"

        var request = URLRequest(url: apiUrl)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")

        let session = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print("Data fetch error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let exercises = try JSONDecoder().decode([Exercise].self, from: data)

                DispatchQueue.main.async { [weak self] in
                    self?.exercises = exercises
                    self?.tableView?.reloadData()
                }

            } catch {
                print("Error decoding JSON data into Exercise array: \(error.localizedDescription)")
            }
        }

        session.resume()
    }
}
