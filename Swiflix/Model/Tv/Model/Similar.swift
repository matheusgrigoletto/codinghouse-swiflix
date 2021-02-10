//
//  Similar.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 11/12/20.
//

import Foundation

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
    
    var asGenericMedia: GenericMedia {
        get {
            GenericMedia(id: self.id,
                         title: self.name,
                         rating: self.vote_average,
                         overview: self.overview,
                         poster: self.poster_path ?? self.backdrop_path ?? "")
        }
    }
    
}
