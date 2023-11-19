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


        
        
        // MARK: - Set text for labels
        nameLabel.text = exercise.name
        typeLabel.text = "Type: \(exercise.type)"
        muscleLabel.text = "Muscle: \(exercise.muscle)"
        equipmentLabel.text = "Equipment: \(exercise.equipment)"
        difficultyLabel.text = "Difficulty: \(exercise.difficulty)"
        instructionsTextView.text = exercise.instructions

//        // MARK: - Fetch and set images for image views
//        // For simplicity, assuming the exercise has an image URL property
//        // You may need to adjust this based on the actual structure of your Exercise model
//
//        if let imageUrl = URL(string: "https://example.com/\(exercise.name.lowercased().replacingOccurrences(of: " ", with: "_")).jpg") {
//            Nuke.loadImage(with: imageUrl, into: exerciseImageView)
//        }
    }

    // Additional code for handling navigation if needed

}
