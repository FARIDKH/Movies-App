//
//  RecentMoviesCollectionViewCell.swift
//  Movies
//
//  Created by Farid Qanbarov on 4/27/18.
//  Copyright © 2018 Farid Qanbarov. All rights reserved.
//

import UIKit

class RecentMoviesCollectionViewCell: UICollectionViewCell {
    
    var movie : Movie? {
        didSet {
            self.movieImage.image = nil
            URLSession.shared.dataTask(with: URL(string:(movie?.imageURL)!)!) {(data, response, error) in
                let image = UIImage(data: data!)
                if error != nil {
                    print(error)
                }
                DispatchQueue.main.async {
                    self.movieImage.image = image
                }
            }.resume()
        }
    }
    
    @IBOutlet weak var movieImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
