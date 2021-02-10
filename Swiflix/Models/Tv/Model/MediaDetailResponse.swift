//
//  DetailTv.swift
//  Swiflix
//
//  Created by Bryan Barreto on 04/12/20.
//

import Foundation

struct MediaDetailResponse: Response {
    
    //MARK: Propriedades comuns
    let backdrop_path: String?
    let genres: [Genre]
    let homepage: String?
    let id: Int
    let original_language: String
    let overview: String?
    let popularity: Double
    let poster_path: String?
    let production_companies: [Company]?
    let production_countries: [ProductionCountry]?
    let spoken_languages: [SpokenLanguage]?
    let status: String?
    let tagline: String?
    let vote_average: Double
    let vote_count: Int
    
    //MARK: Propriedades de séries
    let created_by: [Creator]?
    let episode_run_time: [Int]?
    let first_air_date: String?
    let in_production: Bool?
    let languages: [String]?
    let last_air_date: String?
    let last_episode_to_air: Episode?
    let name: String?
    let next_episode_to_air: Episode?
    let networks: [Company]?
    let number_of_episodes: Int?
    let number_of_seasons: Int?
    let origin_country: [String]?
    let original_name: String?
    let seasons: [Season]?
    let type: String?
    
    //MARK: Propriedades de filmes
    let adult: Bool?
    let belong_to_collection: String?
    let budget: Int?
    let imdb_id: String?
    let original_title: String?
    let release_date: String?
    let revenue: Int?
    let runtime: Int?
    let title: String?
    let video: Bool?
    
}
