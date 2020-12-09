//
//  Tv.swift
//  Swiflix
//
//  Created by Bryan Barreto on 04/12/20.
//

import Foundation
import TMDBSwift

struct Tv: Codable {

    private(set) var poster_path: String?
    private(set) var popularity: Double?
    private(set) var id: Int?
    private(set) var backdrop_path: String?
    private(set) var vote_average: Double?
    private(set) var overview: String?
    private(set) var first_air_date: String?
    private(set) var origin_country: [String]?
    private(set) var genre_ids: [Int]?
    private(set) var original_language: String?
    private(set) var vote_count: Int?
    private(set) var name: String?
    private(set) var original_name: String?

    init() {}
    
    static func parse(from apiReturn: TVMDB) -> Tv {

        var tv = Tv()

        tv.backdrop_path = apiReturn.backdrop_path
        tv.first_air_date = apiReturn.first_air_date
        tv.id = apiReturn.id
        tv.name = apiReturn.name
        tv.origin_country = apiReturn.origin_country
        tv.original_language = apiReturn.original_language
        tv.original_name = apiReturn.original_name
        tv.overview = apiReturn.overview
        tv.popularity = apiReturn.popularity
        tv.poster_path = apiReturn.poster_path
        tv.vote_average = apiReturn.vote_average
        tv.vote_count = Int(apiReturn.vote_count ?? 0)

        return tv
        
    }
    
}
