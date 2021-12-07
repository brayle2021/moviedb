//
//  MovieViewController.swift
//  moviedb
//
//  Created by dearwolves on 06Monday/12/20211.
//

import Foundation
import UIKit


class MovieViewController: BaseViewController {
    
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var releaseDateLAbel: UILabel!
    @IBOutlet weak var ratingLabelText: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    
    static let storyBoardID = "MovieViewController"
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
    }
    
    private func setUpViews() {
        
        let movieImageBaseUrl = "https://image.tmdb.org/t/p/original"
        if let movie = self.movie, let postPath = movie.posterPath, let u = URL(string: movieImageBaseUrl + postPath) {
            moviePosterImageView.load(url: u)
            
            releaseDateLAbel.text = movie.releaseDate
            ratingLabelText.text = String(movie.voteAverage ?? 0)
            popularityLabel.text = String(movie.popularity ?? 0.0)
            
            overViewLabel.text = movie.overview
            
        }
    
    }
}
