//
//  AllMoviesCollectionViewCell.swift
//  Movies
//
//  Created by Farid Qanbarov on 4/27/18.
//  Copyright © 2018 Farid Qanbarov. All rights reserved.
//

import UIKit

class AllMoviesCollectionViewCell: UICollectionViewCell {

    var movie : Movie? {
        didSet {
            self.movieTitle.text = movie?.title
            self.movieImageView.image = nil
            URLSession.shared.dataTask(with: URL(string:(movie?.imageURL)!)!) {(data, response, error) in
                let image = UIImage(data: data!)
                if error != nil {
                    print(error)
                }
                DispatchQueue.main.async {
                    self.movieImageView.image = image
                }
                }.resume()
        }
    }
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
