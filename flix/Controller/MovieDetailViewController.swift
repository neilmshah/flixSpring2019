//
//  MovieDetailViewController.swift
//  flix
//
//  Created by Neil Shah on 1/29/19.
//  Copyright © 2019 Neil Shah. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: MovieData!
    //{
//        didSet{
//            titleLabel.text=movie.title
//            releaseDateLabel.text=movie.release_date
//            overviewLabel.text=movie.overview
//        }
    //}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text=movie.title
        releaseDateLabel.text=movie.release_date
        overviewLabel.text=movie.overview
    }
}
