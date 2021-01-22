//
//  Crew.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 11/12/20.
//

import Foundation

struct Crew: Response {
    
    let id: Int
    let department: String
    let original_language: String?
    let episode_count: Int?
    let job: String
    let overview: String?
    let origin_country: [String]?
    let original_name: String?
    let vote_count: Int?
    let name: String?
    let media_type: String?
    let popularity: Double
    let credit_id: String
    let backdrop_path: String?
    let first_air_date: String?
    let vote_average: Double?
    let genre_ids: [Int]?
    let poster_path: String?
    let original_title: String?
    let video: Bool?
    let title: String?
    let adult: Bool?
    let release_date: String?
    
    var asGenericMedia: GenericMedia {
        get {
            return GenericMedia(id: self.id,
                                title: self.title ?? self.original_title ?? "",
                                rating: self.vote_average ?? 0,
                                overview: self.overview ?? "",
                                poster: self.poster_path ?? self.backdrop_path ?? "")
        }
    }
    
}
