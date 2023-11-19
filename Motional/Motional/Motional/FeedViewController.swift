//import UIKit
//
//class exerciseCell: UITableViewCell {
//    let messageLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .gray
//        label.font = UIFont.italicSystemFont(ofSize: 16)
//        label.textAlignment = .center
//        label.numberOfLines = 0
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        addSubview(messageLabel)
//
//        NSLayoutConstraint.activate([
//            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
//            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
//            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
//        ])
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//class FeedViewController: UIViewController, UITableViewDataSource {
//    
//    @IBOutlet weak var tableView: UITableView!
//    private var exercises: [Exercise] = []
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 200 // You can adjust this value based on your cell content
//
//
//        // Assign table view data source
//        tableView.dataSource = self
//
//        // Register the custom cells
////        tableView.register(PlaceholderCell.self, forCellReuseIdentifier: "PlaceholderCell")
//        tableView.register(ExerciseCell.self, forCellReuseIdentifier: "ExerciseCell")
//
//
//        // Set the background color for visibility
//        tableView.backgroundColor = UIColor.white
//
//        // Call fetchExercises to load data for the chest muscle
//        fetchExercises { [weak self] result in
//            switch result {
//            case .success(let exercises):
//                // Update the exercises array and reload the table view on the main thread
//                DispatchQueue.main.async {
//                    self?.exercises = exercises
//                    self?.tableView.reloadData()
//                }
//            case .failure(let error):
//                // Handle the case where fetching exercises failed
//                print("Failed to fetch exercises with error: \(error)")
//            }
//        }
//    }
//    
//    
//    func fetchExercises(completion: @escaping (Result<[Exercise], Error>) -> Void) {
//        guard let apiUrl = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle=chest") else {
//            completion(.failure(NSError(domain: "Invalid API URL", code: 0, userInfo: nil)))
//            return
//        }
//
//        var request = URLRequest(url: apiUrl)
//        request.setValue("2UWlXCA5qrTw12FiCTmXIw==8EyVf8NrBbeC6YMm", forHTTPHeaderField: "X-Api-Key")
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard let data = data, error == nil else {
//                completion(.failure(error ?? NSError(domain: "Data fetch error", code: 0, userInfo: nil)))
//                return
//            }
//
//            do {
//                let exercises = try JSONDecoder().decode([Exercise].self, from: data)
//                completion(.success(exercises))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ExerciseDetailSegue" {
//            if let indexPath = sender as? IndexPath {
//                let selectedExercise = exercises[indexPath.row]
//                if let destinationVC = segue.destination as? DetailViewController {
//                    destinationVC.exercise = selectedExercise
//                }
//            }
//        }
//    }
//
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "ExerciseDetailSegue", sender: indexPath)
//
//
//    }
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return exercises.count
//        //return max(exercises.count, 10)
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("Cell for row at index path: \(indexPath.row)")
//        
//        if exercises.isEmpty {
//            // If there are no exercises, display a styled placeholder cell
//            let exerciseCell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! exerciseCell
//            exerciseCell.messageLabel.text = "No exercises available"
//            return exerciseCell
//        } else {
//            // If there are exercises, configure and return the ExerciseCell
////            let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseCell
////            let exercise = indexPath.row < exercises.count ? exercises[indexPath.row] : Exercise(name: "Name Not Available", type: "Type Not Available", muscle: "Muscle Not Available", equipment: "Equipment Not Available", difficulty: "Difficulty Not Available", instructions: "Instructions Not Available")
//            
//            let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseCell
//            let exercise = exercises[indexPath.row]
//
//            // Configure the cell
//            cell.configure(with: exercise)
//
//            // Add any additional configuration needed for ExerciseCell
//
//            return cell
//        }
//    }
//}
//
//

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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ExerciseDetailSegue",
              let indexPath = tableView.indexPathForSelectedRow else {
            return
        }

        let selectedExercise = exercises[indexPath.row]

        if let destinationVC = segue.destination as? DetailViewController {
            destinationVC.exercise = selectedExercise
        }
    }

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
