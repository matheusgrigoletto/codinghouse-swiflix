//
//  TvResults.swift
//  Swiflix
//
//  Created by Bryan Barreto on 04/12/20.
//

import Foundation

struct TVPopularResponse: Response {

    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [Self.TV]
    
    struct TV: Response {
        
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
