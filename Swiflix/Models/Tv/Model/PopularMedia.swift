//
//  TV.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 11/12/20.
//

import Foundation

struct PopularMedia: Response {
    
    //MARK: Propriedades comuns
    let poster_path: String?
    let popularity: Double
    let id: Int
    let backdrop_path: String?
    let vote_average: Double
    let overview: String
    let genre_ids: [Int]
    let original_language: String
    let vote_count: Int
    
    //MARK: Propriedades de séries
    let first_air_date: String?
    let origin_country: [String]?
    let name: String?
    let original_name: String?
    
    //MARK: Propriedade de filmes
    let adult: Bool?
    let release_date: String?
    let original_title: String?
    let title: String?
    let video: Bool?
    
}
