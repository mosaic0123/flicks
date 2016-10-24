//
//  extensions.swift
//  Flicks
//
//  Created by tingting_gao on 10/23/16.
//  Copyright © 2016 tingting_gao. All rights reserved.
//

import Foundation
import UIKit

func addErrorView(errorLabel: UILabel, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
    let errorMessage = "❌ Network Error ❗️"
    errorLabel.text = errorMessage
    errorLabel.font = UIFont(name: "AvenirNext-Medium", size: 17)
    errorLabel.textColor = UIColor.white
    errorLabel.textAlignment = NSTextAlignment.center
    errorLabel.backgroundColor = UIColor(red: 7/255.0, green: 149/255.0, blue: 250/255.0, alpha: 1)
    errorLabel.frame = CGRect(x: x, y: y, width: width, height: height)
    errorLabel.isHidden = true
}

func extractJSON(addMovie: (Movie) -> Void, tableView: UITableView, responseDict: NSDictionary, refresh: UIRefreshControl){
    if let result = responseDict["results"] as? [NSDictionary] {
        for movie in result {
            if let poster_path = movie["poster_path"] as? String {
                if let overview = movie["overview"] as? String {
                    if let original_title = movie["original_title"] as? String {
                        let movie = Movie(imageURL: "https://image.tmdb.org/t/p/w500\(poster_path)", title: original_title, overview: overview)
                        addMovie(movie)
                    }
                }
            }
        }
    }
    
    DispatchQueue.main.async {
        tableView.reloadData()
        refresh.endRefreshing()
    }
}

func fetchData(apiURL: String, addMovie: @escaping (Movie) -> Void, tableView: UITableView, errorLabel: UILabel, refresh: UIRefreshControl) {
    //        let apiKey = "464749d1b922c21d04dfde44911c1fec"
    //        let url = NSURL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)&language=en-US")
    let url = NSURL(string: apiURL)!
    let request = URLRequest(
        url: url as URL,
        cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData,
        timeoutInterval: 10)
    
    let session = URLSession(
        configuration: URLSessionConfiguration.default,
        delegate: nil,
        delegateQueue: OperationQueue.main
    )
    
    let task: URLSessionDataTask = session.dataTask(with: request,
        completionHandler: { (dataOrNil, response, errorOrNil) in
            if let requestError = errorOrNil {
                errorLabel.isHidden = false
                print("🔶🔶🔶🔶🔶")
            }
            else {
                print("🔷🔷🔷🔷🔷")
                errorLabel.isHidden = true
                if let data = dataOrNil {
                    if let responseDictionary = try! JSONSerialization.jsonObject(
                        with: data, options:[]) as? NSDictionary {
                        extractJSON(addMovie: addMovie, tableView: tableView, responseDict: responseDictionary, refresh: refresh)
                    }
                }
            }
    })
    task.resume()
}
