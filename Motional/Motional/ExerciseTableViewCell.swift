// ExerciseTableViewCell.swift
import UIKit

class ExerciseTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    
    @IBOutlet weak var muscleLabel: UILabel!
    
    @IBOutlet weak var equipmentLabel: UILabel!
    
    @IBOutlet weak var difficultyLabel: UILabel!
    
    
    @IBOutlet weak var instructionsLabel: UILabel!
    
    
    
    func configure(with exercise: Exercise) {
        nameLabel.text = exercise.name
        typeLabel.text = "Type: \(exercise.type)"
        muscleLabel.text = "Muscle: \(exercise.muscle)"
        equipmentLabel.text = "Equipment: \(exercise.equipment)"
        difficultyLabel.text = "Difficulty: \(exercise.difficulty)"
        instructionsLabel.text = "Instructions: \(exercise.instructions)"
    }
}
