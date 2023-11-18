//
//  ExerciseCell.swift
//  Motional
//
//  Created by Ryan on 11/18/23.
//

import UIKit

class ExerciseCell: UITableViewCell {
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var muscleLabel: UILabel!
    @IBOutlet weak var equipmentLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func configure(with exercise: Exercise) {
//            nameLabel.text = exercise.name
//            typeLabel.text = "Type: \(exercise.type)"
//            muscleLabel.text = "Muscle: \(exercise.muscle)"
//            equipmentLabel.text = "Equipment: \(exercise.equipment)"
//            difficultyLabel.text = "Difficulty: \(exercise.difficulty)"
//            instructionsLabel.text = "Instructions: \(exercise.instructions)"
//        }

}
