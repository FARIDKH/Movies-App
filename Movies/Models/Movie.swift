//
//  Movies.swift
//  Movies
//
//  Created by Farid Qanbarov on 4/27/18.
//  Copyright © 2018 Farid Qanbarov. All rights reserved.
//

import UIKit

class Movie: NSObject {
    var imageURL : String?
    var title : String?
    init(imageURL:String,title:String){
        self.imageURL = imageURL
        self.title = title
    }
}
