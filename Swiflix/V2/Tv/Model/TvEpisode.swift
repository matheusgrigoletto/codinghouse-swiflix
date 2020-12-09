//
// Created by Erik Radicheski da Silva on 08/12/20.
//

import Foundation

struct TvEpisode: Codable {

    let air_date: String
    let episode_number: Int
    let crew: [Crew]?
    let guest_stars: [GuestStar]?
    let id: Int
    let name: String
    let overview: String
    let production_code: String
    let season_number: Int
    let still_path: String
    let vote_average: Double
    let vote_count: Int

}