//
//  MoviesViewController.swift
//  Movies
//
//  Created by Farid Qanbarov on 4/28/18.
//  Copyright © 2018 Farid Qanbarov. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    let movies = Movies.movies
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MoviesViewController did load.")
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        
    }

    func downloadImage(fromURL url: String) -> UIImage? {
        if let imageURL = URL(string: url),
            let imageData = NSData(contentsOf: imageURL)  {
            let data = imageData as Data
            let image = UIImage(data: data)
            return image
        }
        return nil
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Movie Cell", for: indexPath) as! MovieTableViewCell
        if let url = movies[indexPath.row].imageURL {
            cell.movieImage.image = downloadImage(fromURL: url)
        }
        cell.tintColor = .red
        cell.movieTitle.text = movies[indexPath.row].title
        cell.movieCast.text = movies[indexPath.row].cast
        cell.movieGenre.text = movies[indexPath.row].genre
        cell.movieNumber.text = "\(indexPath.row+1)"
        return cell
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
