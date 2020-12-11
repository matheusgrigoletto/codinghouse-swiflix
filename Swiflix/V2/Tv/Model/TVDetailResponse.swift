//
//  DetailTv.swift
//  Swiflix
//
//  Created by Bryan Barreto on 04/12/20.
//

import Foundation

struct TVDetailResponse: Response {

    let backdrop_path: String?
    let created_by: [Self.Creator]?
    let episode_run_time: [Int]?
    let first_air_date: String?
    let genres: [Self.Genre]?
    let homepage: String?
    let id: Int?
    let in_production: Bool?
    let languages: [String]?
    let last_air_date: String?
    let last_episode_to_air: Self.Episode?
    let name: String?
    let next_episode_to_air: Self.Episode?
    let networks: [Self.Network]?
    let number_of_episodes: Int?
    let number_of_seasons: Int?
    let origin_country: [String]?
    let original_language: String?
    let original_name: String?
    let overview: String?
    let popularity: Double?
    let poster_path: String?
    let production_companies: [Self.ProductionCompany]?
    let production_countries: [Self.ProductionCountry]?
    let seasons: [Self.Season]?
    let spoken_languages: [Self.SpokenLanguage]?
    let status: String?
    let tagline: String?
    let type: String?
    let vote_average: Double?
    let vote_count: Int?
    
    struct Creator: Response {
        
        let id: Int
        let credit_id: String
        let name: String
        let gender: Int
        let profile_path: String?
        
    }
    
    struct Genre: Response {
        
        let id: Int
        let name: String
        
    }
    
    struct Episode: Response {
        
    }
    
    struct Network: Response {
        
        let id: Int
        let logo_path: String?
        let name: String
        let origin_country: String
        
    }
    
    struct ProductionCompany: Response {

        let id: Int
        let logo_path: String?
        let name: String
        let origin_country: String

    }
    
    struct ProductionCountry: Response {

        let iso_3166_1: String
        let name: String

    }
    
    struct Season: Response {
        
        let air_date: String
        let episode_count: Int
        let id : Int
        let name: String
        let overview: String
        let poster_path: String
        let season_number: Int
        
    }
    
    struct SpokenLanguage: Codable {

        let english_name: String
        let iso_639_1: String
        let name: String

    }
    
}
