//
//  KnownFor.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 11/12/20.
//

import Foundation

struct KnownFor: Response {
    
    let poster_path: String?
    let adult: Bool?
    let overview: String
    let release_date: String?
    let original_title: String?
    let genre_ids: [Int]
    let id : Int
    let media_type: String
    let original_language: String
    let title: String?
//    let backdrop_path: String
    let popularity: Double?
    let vote_count: Int
    let video: Bool?
    let vote_average: Double
    let first_air_date: String?
    let origin_country: [String]?
    let name: String?
    let original_name: String?
    
}
