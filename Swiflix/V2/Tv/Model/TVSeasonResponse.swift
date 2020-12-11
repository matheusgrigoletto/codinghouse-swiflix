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
    let episodes: [Self.Episode]?
    let name: String
    let overview: String
    let id: Int
    let poster_path: String?
    let season_number: Int
    
    struct Episode: Response {

        let air_date: String
        let episode_number: Int
        let crew: [Self.Crew]?
        let guest_stars: [Self.GuestStar]?
        let id: Int
        let name: String
        let overview: String
        let production_code: String
        let season_number: Int
        let still_path: String
        let vote_average: Double
        let vote_count: Int
        
        struct Crew: Response {

            let department: String
            let job: String
            let credit_id: String
            let adult: Bool?
            let gender: Int
            let id: Int
            let known_for_department: String
            let name: String
            let original_name: String
            let popularity: Double
            let profile_path: String?

        }
        
        struct GuestStar: Response {

            let credit_id: String
            let order: Int
            let character: String
            let adult: Bool
            let gender: Int?
            let id: Int
            let known_for_department: String
            let name: String
            let original_name: String
            let popularity: Double
            let profile_path: String?

        }

    }

}
