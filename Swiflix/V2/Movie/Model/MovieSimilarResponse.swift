//
//  SimilarMovieResult.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 09/12/20.
//

import Foundation

struct MovieSimilarResponse: Response {
    
    let page: Int
    let results: [Self.SimilarMovie]
    let total_pages: Int
    let total_results: Int
    
    struct SimilarMovie: Response {
        
        let poster_path: String?
        let adult: Bool
        let overview: String
        let release_date: String?
        let genre_ids: [Int]
        let id: Int
        let original_title: String
        let original_language: String
        let title: String
        let backdrop_path: String?
        let popularity: Double
        let vote_count: Int
        let video: Bool
        let vote_average: Double
        
    }
    
}
