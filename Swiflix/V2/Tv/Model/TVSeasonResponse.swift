//
//  Season.swift
//  Swiflix
//
//  Created by Bryan Barreto on 04/12/20.
//

import Foundation

struct TVSeasonResponse: Response {

    let _id: String?
    let air_date: String
    let episode_count: Int?
    let episodes: [Episode]?
    let name: String
    let overview: String
    let id: Int
    let poster_path: String?
    let season_number: Int

}
