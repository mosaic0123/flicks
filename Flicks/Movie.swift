//
//  Movie.swift
//  Flicks
//
//  Created by tingting_gao on 10/23/16.
//  Copyright © 2016 tingting_gao. All rights reserved.
//

import Foundation

class Movie {
    var imageURL: String!
    var title: String!
    var overview: String!
    
    init(imageURL: String, title: String, overview: String){
        self.imageURL = imageURL
        self.title = title
        self.overview = overview
    }
    
    var description: String {
        return "url is \(self.imageURL), title is \(self.title), overview is \(self.overview)"
    }
}
