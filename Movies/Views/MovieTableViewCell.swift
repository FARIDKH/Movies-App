//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Farid Qanbarov on 4/29/18.
//  Copyright © 2018 Farid Qanbarov. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieNumber: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieCast: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
