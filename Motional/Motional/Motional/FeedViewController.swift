// FeedViewController.swift
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

        // Call fetchExercises to load data for the chest muscle
        fetchExercises { (exercises) in
            if let exercises = exercises {
                // Do something with the fetched exercises
                print("Fetched exercises: \(exercises)")
            } else {
                // Handle the case where fetching exercises failed
                print("Failed to fetch exercises")
            }
        }

    }


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return max(exercises.count, 10)
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if exercises.isEmpty {
            // If there are no exercises, display a styled placeholder cell
//            tableView.register(ExerciseCell.self, forCellReuseIdentifier: "ExerciseCell")

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

    func fetchExercises(completion: @escaping ([Exercise]?) -> Void) {
        guard let apiUrl = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle=chest") else {
            completion(nil)
            return
        }

        var request = URLRequest(url: apiUrl)
        request.setValue("2UWlXCA5qrTw12FiCTmXIw==8EyVf8NrBbeC6YMm", forHTTPHeaderField: "X-Api-Key")  // Replace YOUR_API_KEY with your actual API key

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                let exercises = try JSONDecoder().decode([Exercise].self, from: data)
                completion(exercises)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
}

