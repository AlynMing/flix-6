//
//  SuperheroDetailViewController.swift
//  flix
//
//  Created by Joseph Fontana on 9/28/20.
//  Copyright © 2020 Joseph Fontana. All rights reserved.
//

import UIKit

class SuperheroDetailViewController: UIViewController {

    @IBOutlet weak var backdropView: UIImageView!
    
    @IBOutlet weak var posterView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie : [String: Any]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(movie)
        
        titleLabel.text = movie["title"] as! String
        
        titleLabel.sizeToFit()
        
        synopsisLabel.text = movie["overview"] as! String
        
        synopsisLabel.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        
        let posterPath = movie["poster_path"] as! String
        
        let posterURL = URL(string: baseUrl + posterPath)
        
        posterView.af_setImage(withURL: posterURL!)
        
        let backdropPath = movie["backdrop_path"] as! String
        
        let backdropURL = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        
        backdropView.af_setImage(withURL: backdropURL!)

        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let movieID = movie["id"] as! Int
        
        let movieIDString = String(movieID)
        
        let link =  "https://api.themoviedb.org/3/movie/\(movieIDString)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US"
        
        let detailsViewController = segue.destination as! MovieTrailerViewController
         
        detailsViewController.apiLink = link
    
    }
    

}
