//
//  TopRatedTableViewCell.swift
//  Flicks
//
//  Created by tingting_gao on 10/23/16.
//  Copyright © 2016 tingting_gao. All rights reserved.
//

import UIKit

class TopRatedTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var movieDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
