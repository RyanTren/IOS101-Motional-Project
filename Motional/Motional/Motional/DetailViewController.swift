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

            // Check if exercise is not nil before accessing its properties
            guard let exercise = exercise else {
                print("Exercise is nil")
                return
            }
            
            nameLabel.text = exercise.name
            typeLabel.text = "Type: \(exercise.type)"
            muscleLabel.text = "Muscle: \(exercise.muscle)"
            equipmentLabel.text = "Equipment: \(exercise.equipment)"
            difficultyLabel.text = "Difficulty: \(exercise.difficulty)"
            instructionsTextView.text = exercise.instructions
        }
    }
