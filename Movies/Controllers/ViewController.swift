//
//  ViewController.swift
//  Movies
//
//  Created by Farid Qanbarov on 4/27/18.
//  Copyright © 2018 Farid Qanbarov. All rights reserved.
//

import UIKit
import CoreData



class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource ,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let memoryCapacity = 500 * 1024 * 1024
        let diskCapacity = 500 * 1024 * 1024
        let urlCache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity, diskPath: "myDiskPath")
        URLCache.shared = urlCache
        
        latestMoviesCollectionView.register(UINib.init(nibName: "RecentMoviesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: latestMoviesCollectionViewIdentifier)
        allMoviesCollectionView.register(UINib.init(nibName: "AllMoviesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: allMoviesCollectionViewIdentifier)
        
        latestMoviesCollectionView.delegate = self
        latestMoviesCollectionView.dataSource = self
        allMoviesCollectionView.delegate = self
        allMoviesCollectionView.dataSource = self
        self.navigationItem.titleView = pagesSegmentedControl
        self.navigationController?.navigationBar.barTintColor = .black
        pagesSegmentedControl.selectedSegmentIndex = 0
        pagesSegmentedControl.addTarget(self, action: #selector(switchPages), for: .valueChanged)
    }
    
    @IBOutlet weak var latestMoviesCollectionView: UICollectionView!
    @IBOutlet weak var allMoviesView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var allMoviesCollectionView: UICollectionView!
    
    var currentViewController : UIViewController?
    lazy var firstViewController : UIViewController? = {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EntryViewController")
        return vc
    }()
    lazy var secondViewController : UIViewController? = {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MoviesViewController")
        return vc
    }()
    
    

    
    @objc func switchPages() {
        self.currentViewController?.view.removeFromSuperview()
        self.currentViewController?.removeFromParentViewController()
        displayCurrentView(pagesSegmentedControl.selectedSegmentIndex)
    }
    
    func selectedViewController(_ index: Int) -> UIViewController? {
        var vc : UIViewController?
        switch index {
        case 0:
            vc = firstViewController
        case 1:
            vc = secondViewController
        default:
            return nil
        }
        return vc
    }
    
    func displayCurrentView(_ index: Int) {
        if let vc = selectedViewController(index) {
            self.addChildViewController(vc)
            vc.didMove(toParentViewController: self)
            vc.view.frame = allMoviesView.bounds
            self.allMoviesView.addSubview(vc.view)
            self.currentViewController = vc
        }
    }
    let latestMoviesCollectionViewIdentifier = "Latest Movies Cell"
    let allMoviesCollectionViewIdentifier = "All Movies Cell"
    
    let pagesSegmentedControl : UISegmentedControl = {
        let titles : [NSString] = ["Featured","Charts"]
        let segmentedControl = UISegmentedControl(items: titles)
        return segmentedControl
    }()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationVC = segue.destination
        if segue.identifier == "goToAllMovies" {
            if let navVC = destinationVC as? UINavigationController {
                destinationVC = navVC.visibleViewController ?? navVC
            }
            if let moviesVC = destinationVC as? MoviesViewController {
                moviesVC.navigationItem.titleView = pagesSegmentedControl
                moviesVC.navigationItem.hidesBackButton = true
            }
        }
    }
    
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

        scrollView.contentSize = CGSize(width: view.frame.size.width, height: contentHeight)
        allMoviesView.translatesAutoresizingMaskIntoConstraints = true
        allMoviesView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: contentHeight)
        
        
        if collectionView == latestMoviesCollectionView {
            return 4
        }
            return Movies.movies.count
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = Movies.movies[indexPath.row]
        if collectionView == latestMoviesCollectionView {
            let cellForLatestMovies = collectionView.dequeueReusableCell(withReuseIdentifier: latestMoviesCollectionViewIdentifier, for: indexPath) as! RecentMoviesCollectionViewCell
            cellForLatestMovies.movie = movie
            return cellForLatestMovies

        }
    
        let cellForAllMovies = collectionView.dequeueReusableCell(withReuseIdentifier: allMoviesCollectionViewIdentifier, for: indexPath) as! AllMoviesCollectionViewCell
        
        cellForAllMovies.movie = movie
        
        return cellForAllMovies
        
    }
    

    
    
}

