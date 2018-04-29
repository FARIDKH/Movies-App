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
    var genre : String?
    var cast : String?
    init(imageURL:String,title:String,genre:String,cast:String?){
        self.imageURL = imageURL
        self.title = title
        self.genre = genre
        self.cast = cast

    }
}

class Movies {
    static var movies : [Movie] = [
        Movie(imageURL: "http://es.web.img2.acsta.net/pictures/16/04/22/11/45/321080.jpg", title: "Angry Birds",genre:"Comedy",cast:nil),
        Movie(imageURL: "http://cafmp.com/wp-content/uploads/2012/11/Avatar-608x900.jpg", title: "Avatar", genre: "Sci-Fi,Action", cast: "Aamna Sharif Aarathi Aarti Agarwal Aarti Chhabria Abhirami Adah Sharma"),
        Movie(imageURL: "https://media1.popsugar-assets.com/files/thumbor/8wedSPI4RyNdIbYuQr9w9zy0sLA/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2017/01/26/813/n/1922283/055dc333c3280d59_BeautyAndTheBeast58726d5b9fac8/i/Beauty-Beast-2017-Movie-Posters.jpg", title: "Beauty and The Beast", genre: "Music,Comedy", cast: "Sanjana Gandhi (now Pooja Gandhi) Santoshi Sarah Jane Dias Saranya Mohan Sarayu (actress) Sarika Saritha Saroja Devi"),
        Movie(imageURL: "http://img.moviepostershop.com/step-brothers-movie-poster-2008-1020407830.jpg", title: "Step Brothers", genre: "Comedy",cast:"Taruni Sachdev Tejaswi Madivada Tena Desae Tia Bajpai"),
        Movie(imageURL: "https://i.pinimg.com/736x/3f/2a/6d/3f2a6d92d9017355bdf4809e185d4eed--before-we-go-movie-covers.jpg", title: "Before we go",genre:"Music, Thriller",cast:"Taruni Sachdev Tejaswi Madivada Tena Desae Tia Bajpai"),
        Movie(imageURL: "http://www.underthecoversbookblog.com/wp-content/uploads/2014/03/Divergent_poster_hq-250x390.jpg", title: "Divergent",genre:"Sci-fi,Mystery,Thriller",cast:"Usha Kiran Usha Nadkarni Ulka Gupta"),
        Movie(imageURL: "http://img.moviepostershop.com/the-shawshank-redemption-movie-poster-1994-1020191906.jpg", title: "Shawshank Redemption",genre:"Drama,Thriller,Mystery",cast:"Tim Robbins, Morgan Freeman, Bob Gunton"),
        Movie(imageURL: "https://siudy.net/wp-content/uploads/2018/01/and-should-be-annabelle-creation-dvd-cover-addict-free-bluray-annabelle-movie-covers-2017-creation-dvd-cover-addict-free-and-bluray-thor.jpg", title: "Fist Fight",genre:"Comedy",cast:"Tim Robbins, Morgan Freeman, Bob Gunton"),
        Movie(imageURL: "https://i.pinimg.com/originals/3d/fe/02/3dfe024855c47a83d9d531f1c5d516ee.png", title: "Ask yeniden",genre:"Comedy, Romance",cast:"Bugra Gulsoy,Ozge Ozpirincci"),
        Movie(imageURL: "https://i.pinimg.com/originals/3f/10/16/3f10164ab5816fa24df49f7a12ccdf7c.jpg", title: "Abductions",genre:"Sci-Fi",cast:"Tim Robbins, Morgan Freeman, Bob Gunton")
    ]
}


