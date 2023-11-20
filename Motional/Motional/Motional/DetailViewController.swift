//
//  DetailViewController.swift
//  Motional
//
//  Created by Ryan on 11/18/23.
//
import UIKit
//import Nuke

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var muscleLabel: UILabel!
    
    @IBOutlet weak var equipmentLabel: UILabel!
    
    @IBOutlet weak var difficultyLabel: UILabel!
    
    @IBOutlet weak var instructionsTextView: UITextView!
    
    
    
    
    
    var exercise: Exercise!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let exercise = exercise else {
            print("Exercise is nil in DetailViewController")
            return
        }

        // Assuming your data retrieval is asynchronous, make sure UI updates happen on the main thread
        DispatchQueue.main.async {
            self.nameLabel.text = exercise.name
            self.typeLabel.text = "Type: \(exercise.type)"
            self.muscleLabel.text = "Muscle: \(exercise.muscle)"
            self.equipmentLabel.text = "Equipment: \(exercise.equipment)"
            self.difficultyLabel.text = "Difficulty: \(exercise.difficulty)"
            self.instructionsTextView.text = exercise.instructions
        }


        print("Exercise details - Name: \(exercise.name), Type: \(exercise.type), Muscle: \(exercise.muscle), Equipment: \(exercise.equipment), Difficulty: \(exercise.difficulty), Instructions: \(exercise.instructions)")
    }

}
