//
//  Movie.swift
//  Swiflix
//
//  Created by Bryan Barreto on 04/12/20.
//

import Foundation

struct MovieDetailResponse: Response {
    
    let adult: Bool
    let backdrop_path: String
    let belong_to_collection: String?
    let budget: Int
    let genres: [Self.Genre]
    let homepage: String?
    let id: Int
    let imdb_id: String?
    let original_language: String
    let original_title: String
    let overview: String?
    let popularity: Double
    let poster_path: String
    let production_companies: [Self.ProductionCompany]
    let production_countries: [Self.ProductionCountry]
    let release_date: String
    let revenue: Int
    let runtime: Int?
    let spoken_languages: [Self.SpokenLanguage]
    let status: String
    let tagline: String?
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
    
    struct Genre: Response {
        
        let id: Int
        let name: String
        
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
    
    struct SpokenLanguage: Codable {

        let english_name: String
        let iso_639_1: String
        let name: String

    }
    
}
