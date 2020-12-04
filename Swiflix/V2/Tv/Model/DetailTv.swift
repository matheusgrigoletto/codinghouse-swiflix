//
//  DetailTv.swift
//  Swiflix
//
//  Created by Bryan Barreto on 04/12/20.
//

import Foundation

struct DetailTv {
    let name: String
    let original_name: String
    let poster_path:String
    let id: Int
    let backdrop_path:String
    let vote_average:Double
    let overview: String
    let episode_run_time: [Int]
    let first_air_date: String
    let genres: [Genre]
    let in_production:Bool
    let number_of_episodes: Int
    let number_of_seasons: Int
    let seasons: [Season]
    let status: String
    let type: String
}
