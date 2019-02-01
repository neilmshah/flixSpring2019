//
//  MovieAPIManager.swift
//  flix
//
//  Created by Neil Shah on 1/29/19.
//  Copyright © 2019 Neil Shah. All rights reserved.
//

import Foundation

class MovieAPIManager {
    
    static let nowPlayingURL = "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
    
    func fetchNowPlaying(completionHandler: @escaping ([MovieData]?) -> Void){
        let url = URL(string: MovieAPIManager.nowPlayingURL)!
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(Envelope.self, from: data)
                    completionHandler(jsonData.results)
                } catch {
                    completionHandler(nil)
                    print(err?.localizedDescription as Any)
                }
            }
        }.resume()
    }
    
}

