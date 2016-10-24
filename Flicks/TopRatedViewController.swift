//
//  TopRatedViewController.swift
//  Flicks
//
//  Created by tingting_gao on 10/23/16.
//  Copyright © 2016 tingting_gao. All rights reserved.
//

import UIKit
import AFNetworking

class TopRatedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var apiURL: String = "https://api.themoviedb.org/3/movie/top_rated?api_key=464749d1b922c21d04dfde44911c1fec&language=en-US"
    var movieList:[Movie] = []
    var errorLabel = UILabel()
    var refreshControl = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addErrorView(errorLabel: errorLabel, x: (self.navigationController?.navigationBar.frame.minX)!, y: (self.navigationController?.navigationBar.frame.maxY)!, width: tableView.frame.width, height: 40)
        view.addSubview(errorLabel)
        refreshControl.addTarget(self, action: "refreshControlAction:", for: UIControlEvents.valueChanged)
        // add refresh control to table view
        tableView.insertSubview(refreshControl, at: 0)
        fetchData(apiURL: apiURL, addMovie: addMovie, tableView: self.tableView, errorLabel: errorLabel, refresh: refreshControl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                 for: indexPath) as! TopRatedTableViewCell
        var movie = self.movieList[indexPath.row]
        cell.movieImageView.setImageWith(URL(string: movie.imageURL)!)
        cell.title.text = movie.title!
        cell.movieDescription.text = movie.overview!
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        var movie = self.movieList[indexPath.row]
//        var detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "MyDetailViewController") as! DetailViewController
//        
//        detailViewController.backgroundImageView.setImageWith(URL(string: movie.imageURL)!)
////        detailViewController.titleLabel.text = movie.title!
////        detailViewController.overviewLabel.text = movie.overview!
//        self.navigationController?.pushViewController(detailViewController, animated: true)
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func addMovie(movie: Movie) {
        self.movieList.append(movie)
    }

    func refreshControlAction(_ sender: UIRefreshControl!) {
        fetchData(apiURL: apiURL, addMovie: addMovie, tableView: self.tableView, errorLabel: errorLabel, refresh: sender)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailTR" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destionalController = segue.destination as! MovieViewController
                var movie = self.movieList[indexPath.row]
                destionalController.movie = movie
                self.tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }

}
