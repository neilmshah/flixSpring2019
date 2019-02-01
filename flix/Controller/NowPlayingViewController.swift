//
//  NowPlayingViewController.swift
//  flix
//
//  Created by Neil Shah on 1/29/19.
//  Copyright © 2019 Neil Shah. All rights reserved.
//

import UIKit
import MBProgressHUD

class NowPlayingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    //var movies = [[String:Any]]()
    var movies = [MovieData]()
    
    let refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        
        fetchMovies()
        
        tableView.refreshControl=refreshControl
        refreshControl.addTarget(self, action: #selector(didPullToRefresh(_:)), for: .valueChanged)
    }
    
    @objc func fetchMovies() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        MovieAPIManager().fetchNowPlaying { (movies) in
            if let movies = movies {
                self.movies = movies
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.refreshControl.endRefreshing()
                    MBProgressHUD.hide(for: self.view, animated: true)
                }
            }
        }
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="detailSegue") {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let detailVC = segue.destination as! MovieDetailViewController
            detailVC.movie = self.movies[(indexPath?.row)!]
        }
    }
    
    @objc func didPullToRefresh(_: UIRefreshControl){
        fetchMovies()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.movies = self.movies[indexPath.row]
//        var data = self.movies[indexPath.row]
//        cell.titleLabel.text=data["title"] as? String
//        cell.overviewLabel.text=data["overview"] as? String
        
        return cell
    }
    
}
