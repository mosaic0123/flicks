//
//  MovieViewController.swift
//  Flicks
//
//  Created by tingting_gao on 10/23/16.
//  Copyright © 2016 tingting_gao. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIImageView!
    var movie: Movie?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundView.setImageWith(URL(string: (movie?.imageURL)!)!)
        self.titleLabel.text = movie?.title!
        self.overviewLabel.text = movie?.overview!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
