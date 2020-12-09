//
//  Season.swift
//  Swiflix
//
//  Created by Bryan Barreto on 04/12/20.
//

import Foundation

struct TvSeason: Codable {

    let _id: String?
    let air_date: String
    let episode_count: Int?
    let episodes: [TvEpisode]?
    let name: String
    let overview: String
    let id: Int
    let poster_path: String?
    let season_number: Int

}
