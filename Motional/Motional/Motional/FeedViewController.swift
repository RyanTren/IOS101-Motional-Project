// FeedViewController.swift
import UIKit
import UIKit

class PlaceholderCell: UITableViewCell {
    let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.italicSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(messageLabel)

        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class FeedViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Add property to store fetched exercises array
    private var exercises: [Exercise] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Assign table view data source
        tableView.dataSource = self

        // Register the custom placeholder cell
        tableView.register(PlaceholderCell.self, forCellReuseIdentifier: "PlaceholderCell")

        // Set the background color for visibility
        tableView.backgroundColor = UIColor.lightGray

        // Call fetchExercises to load data
        fetchExercises()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.isEmpty ? 1 : exercises.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if exercises.isEmpty {
            // If there are no exercises, display a styled placeholder cell
            let placeholderCell = tableView.dequeueReusableCell(withIdentifier: "PlaceholderCell", for: indexPath)
            placeholderCell.textLabel?.text = "No exercises available"
            placeholderCell.textLabel?.textColor = .gray
            placeholderCell.textLabel?.font = UIFont.italicSystemFont(ofSize: 16)
            placeholderCell.textLabel?.textAlignment = .center
            return placeholderCell
        } else {
            // If there are exercises, configure and return the ExerciseCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseCell

            let exercise = exercises[indexPath.row]

            // Configure the cell
            cell.nameLabel.text = exercise.name
            cell.muscleLabel.text = exercise.muscle
            cell.instructionsLabel.text = exercise.instructions

            // Add any additional configuration needed for ExerciseCell

            return cell
        }
    }

    func fetchExercises() {
        let apiUrl = "https://api.api-ninjas.com/v1/exercises?muscle=legs"
        let apiKey = "2UWlXCA5qrTw12FiCTmXIw==8EyVf8NrBbeC6YMm"

        guard let url = URL(string: apiUrl) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "Api-Key")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }

            if let data = data {
                do {
                    // Decode the response into a dictionary
                    if let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        // Assuming the structure is like {"exercises": [...]}, extract the array
                        if let exercisesArray = jsonDictionary["exercises"] as? [[String: Any]] {
                            // Now try to decode the array of exercises
                            let decodedExercises = try JSONDecoder().decode([Exercise].self, from: JSONSerialization.data(withJSONObject: exercisesArray))
                            
                            // Update the UI on the main thread
                            DispatchQueue.main.async { [weak self] in
                                self?.exercises = decodedExercises
                                self?.tableView.reloadData()
                            }
                        }
                    }
                } catch {
                    print("Error decoding exercises: \(error)")
                }
            }
        }.resume()
    }


}

