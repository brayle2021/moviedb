//
//  MovieListTableViewCell.swift
//  moviedb
//
//  Created by dearwolves on 06Monday/12/20211.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    static let identifier = "MovieListTableViewCell"
    
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverView: UILabel!
    
    
    public var cellMovie: Movie! {
        didSet {
            let movieImageBaseUrl = "https://image.tmdb.org/t/p/original"
            movieTitle.text = cellMovie.title
            movieOverView.text = cellMovie.overview
            if let postPath = cellMovie.posterPath, let u = URL(string: movieImageBaseUrl + postPath) {
                movieImage.load(url: u)
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
