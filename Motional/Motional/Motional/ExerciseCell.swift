//
//  ExerciseCell.swift
//  Motional
//
//  Created by Ryan on 11/18/23.
//

import UIKit

class ExerciseCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(with exercise: Exercise) {
        print("Exercise name: \(exercise.name)")
        nameLabel?.text = exercise.name
        //nameLabel?.textColor = .black
    }



    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
