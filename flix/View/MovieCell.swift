//
//  MovieCell.swift
//  flix
//
//  Created by Neil Shah on 1/29/19.
//  Copyright © 2019 Neil Shah. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieCell: UITableViewCell {
    
    
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movies: MovieData! {
        didSet{
            titleLabel.text = movies.title
            overviewLabel.text = movies.overview
            
            let baseURLString: String = "https://image.tmdb.org/t/p/w500/"
            if let posterString = movies.poster_path {
                let posterURL = URL(string: baseURLString + posterString)
                let filter = AspectScaledToFillSizeWithRoundedCornersFilter(size: posterImageView.frame.size, radius: 5.0)
                posterImageView.af_setImage(withURL: posterURL!, filter: filter)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
