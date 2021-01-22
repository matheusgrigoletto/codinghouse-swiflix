//
//  Episode.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 11/12/20.
//

import Foundation

struct Episode: Response {

    let air_date: String
    let episode_number: Int
    let crew: [Crew]?
    let guest_stars: [GuestStar]?
    let id: Int
    let name: String
    let overview: String
    let production_code: String
    let season_number: Int
    let still_path: String?
    let vote_average: Double
    let vote_count: Int
    
    var season: Int {
        get {
            self.season_number
        }
    }
    
    var episode: Int {
        get {
            self.episode_number
        }
    }
    
    var asSerieEpisode: SerieEpisode {
        get {
            SerieEpisode(backdrop: self.still_path ?? "",
                         season: self.season_number,
                         episode: self.episode_number,
                         title: self.name,
                         releaseDate: self.air_date,
                         overview: self.overview)
        }
    }

}
