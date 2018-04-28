//
//  ViewController.swift
//  Movies
//
//  Created by Farid Qanbarov on 4/27/18.
//  Copyright © 2018 Farid Qanbarov. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource ,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var latestMoviesCollectionView: UICollectionView!
    var movies : [Movie] = [
        Movie(imageURL: "http://es.web.img2.acsta.net/pictures/16/04/22/11/45/321080.jpg", title: "Angry Birds"),
        Movie(imageURL: "http://cafmp.com/wp-content/uploads/2012/11/Avatar-608x900.jpg", title: "Avatar"),
        Movie(imageURL: "https://media1.popsugar-assets.com/files/thumbor/8wedSPI4RyNdIbYuQr9w9zy0sLA/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2017/01/26/813/n/1922283/055dc333c3280d59_BeautyAndTheBeast58726d5b9fac8/i/Beauty-Beast-2017-Movie-Posters.jpg", title: "Beauty and The Beast"),
        Movie(imageURL: "http://img.moviepostershop.com/step-brothers-movie-poster-2008-1020407830.jpg", title: "Step Brothers"),
        Movie(imageURL: "https://i.pinimg.com/736x/3f/2a/6d/3f2a6d92d9017355bdf4809e185d4eed--before-we-go-movie-covers.jpg", title: "Before we go"),
        Movie(imageURL: "http://www.underthecoversbookblog.com/wp-content/uploads/2014/03/Divergent_poster_hq-250x390.jpg", title: "Divergent"),
        Movie(imageURL: "http://img.moviepostershop.com/the-shawshank-redemption-movie-poster-1994-1020191906.jpg", title: "Shawshank Redemption"),
        Movie(imageURL: "https://siudy.net/wp-content/uploads/2018/01/and-should-be-annabelle-creation-dvd-cover-addict-free-bluray-annabelle-movie-covers-2017-creation-dvd-cover-addict-free-and-bluray-thor.jpg", title: "Fist Fight"),
        Movie(imageURL: "https://i.pinimg.com/originals/3d/fe/02/3dfe024855c47a83d9d531f1c5d516ee.png", title: "Ask yeniden"),
        Movie(imageURL: "https://i.pinimg.com/originals/3f/10/16/3f10164ab5816fa24df49f7a12ccdf7c.jpg", title: "Abductions")
        ]
    
    @IBOutlet weak var allMoviesView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var allMoviesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        latestMoviesCollectionView.register(UINib.init(nibName: "RecentMoviesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: latestMoviesCollectionViewIdentifier)
        allMoviesCollectionView.register(UINib.init(nibName: "AllMoviesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: allMoviesCollectionViewIdentifier)
        
        latestMoviesCollectionView.delegate = self
        latestMoviesCollectionView.dataSource = self
        allMoviesCollectionView.delegate = self
        allMoviesCollectionView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    let latestMoviesCollectionViewIdentifier = "Latest Movies Cell"
    let allMoviesCollectionViewIdentifier = "All Movies Cell"
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == latestMoviesCollectionView {
            return 0.0
        }
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == latestMoviesCollectionView {
            return CGSize(width: view.frame.size.width, height: 150)
        }
        return CGSize(width: round(view.frame.size.width/3.2), height: 200)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let contentHeight = latestMoviesCollectionView.contentSize.height + allMoviesCollectionView.contentSize.height
        print("\(allMoviesView.frame.origin.x) \(allMoviesView.frame.origin.y)")
        print("\(latestMoviesCollectionView.frame.origin.x) \(latestMoviesCollectionView.frame.origin.y)")

        scrollView.contentSize = CGSize(width: view.frame.size.width, height: contentHeight)
        allMoviesView.translatesAutoresizingMaskIntoConstraints = true
        allMoviesView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: contentHeight)
        
        
        if collectionView == latestMoviesCollectionView {
            return 4
        }
            return movies.count
        
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = movies[indexPath.row]
        if collectionView == latestMoviesCollectionView {
            let cellForLatestMovies = collectionView.dequeueReusableCell(withReuseIdentifier: latestMoviesCollectionViewIdentifier, for: indexPath) as! RecentMoviesCollectionViewCell
            if let url = movie.imageURL {
                cellForLatestMovies.movieImage.image = self.downloadImage(fromURL: url)
            }
            return cellForLatestMovies

        }
    
        let cellForAllMovies = collectionView.dequeueReusableCell(withReuseIdentifier: allMoviesCollectionViewIdentifier, for: indexPath) as! AllMoviesCollectionViewCell
        
        if let url = movie.imageURL,let title = movie.title {
            cellForAllMovies.movieImageView.image = self.downloadImage(fromURL: url)
            cellForAllMovies.movieTitle.text = title
        }
        
        return cellForAllMovies
        
    }
    

    
    
}

