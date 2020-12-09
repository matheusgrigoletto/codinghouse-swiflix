//
//  UpcomingMovies.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 09/12/20.
//

import Foundation

struct UpcomingResults: Codable {
    
    let page: Int
    let results: [UpcomingMovie]
    let dates: UpcomingDate
    let total_pages: Int
    let total_results: Int
    
    struct UpcomingMovie: Codable {
        
        let poster_path: String?
        let adult: Bool
        let overview: String
        let release_date: String
        let genre_ids: [Int]
        let original_title: String
        let title: String
        let backdrop_path: String?
        let popularity: Double
        let vote_count: Int
        let video: Bool
        let vote_average: Double
        
    }
    
    struct UpcomingDate: Codable {
        
        let maximum: String
        let minimum: String
        
    }
    
}
