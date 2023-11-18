//
//  DetailViewController.swift
//  Motional
//
//  Created by Ryan on 11/18/23.
//

// DetailViewController.swift
import UIKit

class DetailViewController: UIViewController {
    
    var exercise: Exercise!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var muscleLabel: UILabel!
    @IBOutlet weak var equipmentLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        // Set labels based on the exercise
        nameLabel.text = exercise.name
        typeLabel.text = exercise.type
        muscleLabel.text = exercise.muscle
        equipmentLabel.text = exercise.equipment
        difficultyLabel.text = exercise.difficulty
        instructionsLabel.text = exercise.instructions
    }
}


