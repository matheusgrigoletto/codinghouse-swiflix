//
//  PersonCredits.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 11/12/20.
//

import Foundation

struct PersonCreditsResponse: Response {
    
    let cast: [Self.Cast]
    let crew: [Self.Crew]
    let id: Int
    
    struct Cast: Response {
        
        let id: Int
        let original_language: String
        let episode_count: Int?
        let overview: String
        let origin_country: [String]?
        let original_name: String?
        let genre_ids: [Int]
        let name: String?
        let media_type: String
        let poster_path: String?
        let first_air_date: String?
        let vote_average: Double
        let vote_count: Int
        let character: String
        let backdrop_path: String?
        let popularity: Double
        let credit_id: String
        let original_title: String?
        let video: Bool?
        let release_date: String?
        let title: String?
        let adult: Bool?
        
    }
    
    struct Crew: Response {
        
        let id: Int
        let department: String
        let original_language: String
        let episode_count: Int?
        let job: String
        let overview: String
        let origin_country: [String]?
        let original_name: String?
        let vote_count: Int
        let name: String?
        let media_type: String
        let popularity: Double
        let credit_id: String
        let backdrop_path: String?
        let first_air_date: String?
        let vote_average: Double
        let genre_ids: [Int]
        let poster_path: String?
        let original_title: String
        let video: Bool
        let title: String
        let adult: Bool
        let release_date: String
        
    }
    
}
