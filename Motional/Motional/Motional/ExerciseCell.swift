//
//  ExerciseCell.swift
//  Motional
//
//  Created by Ryan on 11/18/23.
//

import UIKit

class ExerciseCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var muscleLabel: UILabel!
    
    @IBOutlet weak var instructionsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
