//
//  Movie.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 31/10/20.
//

import Foundation

struct Movies: Codable {
    
    var id: Int?
    var department: String?
    var originalLanguage: String?
    var episodeCount: Int?
    var job: String?
    var overview: String?
    var originCountry: [String]?
    var originalName: String?
    var genreIds: [Int]?
    var name: String?
    var mediaType: String?
    var posterPath: String?
    var firstAirDate: String?
    var voteAverage: Double?
    var voteCount: Int?
    var character: String?
    var backdropPath: String?
    var popularity: Double?
    var creditId: String?
    var originalTitle: String?
    var video: Bool?
    var releaseDate: String?
    var title: String?
    var adult: Bool?
    
    enum CodingKeys: String, CodingKey {
        
        case originalLanguage = "original_language"
        case episodeCount = "episode_count"
        case originCountry = "origin_country"
        case originalName = "original_name"
        case genreIds = "genre_ids"
        case mediaType = "media_type"
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case backdropPath = "backdrop_path"
        case creditId = "credit_id"
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        
    }
    
}
