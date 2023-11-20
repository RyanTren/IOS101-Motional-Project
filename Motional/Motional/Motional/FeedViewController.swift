//  FeedViewController.swift

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return muscleOptions.count
    }

        // MARK: - UIPickerViewDelegate

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return muscleOptions[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedMuscle = muscleOptions[row].lowercased()
        fetchExercises(forMuscle: selectedMuscle)
    }

    

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var musclePicker: UIPickerView!
    
    
    
    
    
    private var exercises: [Exercise] = []
    private var muscleOptions: [String] = [
        "abdominals",
        "abductors",
        "adductors",
        "biceps",
        "calves",
        "chest",
        "forearms",
        "glutes",
        "hamstrings",
        "lats",
        "lower_back",
        "middle_back",
        "neck",
        "quadriceps",
        "traps",
        "triceps"
    ]


    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true

        tableView?.dataSource = self
        musclePicker.delegate = self
        musclePicker.dataSource = self
        fetchExercises(forMuscle: muscleOptions[musclePicker.selectedRow(inComponent: 0)].lowercased())


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

    private func fetchExercises(forMuscle muscle: String) {
        guard let apiUrl = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle=\(muscle)") else {
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
