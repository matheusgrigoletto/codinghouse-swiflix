//
//  Cast.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 11/12/20.
//

import Foundation

struct Cast: Response {
    
    let id: Int
    let original_language: String
    let episode_count: Int?
    let overview: String
    let origin_country: [String]?
    let original_name: String?
    let genre_ids: [Int]
    let name: String?
    let media_type: String
    let poster_path: String?
    let first_air_date: String?
    let vote_average: Double
    let vote_count: Int
    let character: String
    let backdrop_path: String?
    let popularity: Double
    let credit_id: String
    let original_title: String?
    let video: Bool?
    let release_date: String?
    let title: String?
    let adult: Bool?
    
    var asGenericMedia: GenericMedia {
        get {
            return GenericMedia(id: self.id,
                                title: self.title ?? self.original_title ?? "",
                                rating: self.vote_average,
                                overview: self.overview,
                                poster: self.poster_path ?? self.backdrop_path ?? "")
        }
    }
    
}
