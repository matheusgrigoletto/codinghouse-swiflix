//
//  SimilarTv.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 09/12/20.
//

import Foundation

struct TVSimilarResponse: Response {
    
    let page: Int
    let results: [Self.Similar]
    let total_pages: Int
    let total_results: Int
    
    struct Similar: Codable {
        
        let poster_path: String?
        let popularity: Double
        let id: Int
        let backdrop_path: String?
        let vote_average: Double
        let overview: String
        let first_air_date: String
        let origin_country: [String]
        let genre_ids: [Int]
        let original_language: String
        let vote_count: Int
        let name: String
        let original_name: String
        
    }
    
}
