//
//  DetailTv.swift
//  Swiflix
//
//  Created by Bryan Barreto on 04/12/20.
//

import Foundation
import TMDBSwift

struct DetailTv: Codable {

    private(set) var backdrop_path: String?
    private(set) var created_by: [Creator]?
    private(set) var episode_run_time: [Int]?
    private(set) var first_air_date: String?
    private(set) var genres: [Genre]?
    private(set) var homepage: String?
    private(set) var id: Int?
    private(set) var in_production: Bool?
    private(set) var languages: [String]?
    private(set) var last_air_date: String?
    private(set) var last_episode_to_air: TvEpisode?
    private(set) var name: String?
    private(set) var next_episode_to_air: TvEpisode?
    private(set) var networks: [Network]?
    private(set) var number_of_episodes: Int?
    private(set) var number_of_seasons: Int?
    private(set) var origin_country: [String]?
    private(set) var original_language: String?
    private(set) var original_name: String?
    private(set) var overview: String?
    private(set) var popularity: Double?
    private(set) var poster_path: String?
    private(set) var production_companies: [ProductionCompany]?
    private(set) var production_countries: [ProductionCountry]?
    private(set) var seasons: [TvSeason]?
    private(set) var spoken_languages: [SpokenLanguage]?
    private(set) var status: String?
    private(set) var tagline: String?
    private(set) var type: String?
    private(set) var vote_average: Double?
    private(set) var vote_count: Int?
    
    init() {}

    static func parse(from apiReturn: TVMDB) -> DetailTv {

        var detailTv = DetailTv()

        detailTv.backdrop_path = apiReturn.backdrop_path
        detailTv.first_air_date = apiReturn.first_air_date

        var genres: [Genre] = []
        apiReturn.genres.forEach {
            genres.append(Genre(id: $0.id ?? 0, name: $0.name ?? ""))
        }
        detailTv.genres = genres

        detailTv.id = apiReturn.id
        detailTv.name = apiReturn.name
        detailTv.origin_country = apiReturn.origin_country
        detailTv.original_language = apiReturn.original_language
        detailTv.original_name = apiReturn.original_name
        detailTv.overview = apiReturn.overview
        detailTv.popularity = apiReturn.popularity
        detailTv.poster_path = apiReturn.poster_path
        detailTv.vote_average = apiReturn.vote_average
        detailTv.vote_count = Int(apiReturn.vote_count ?? 0)

        return detailTv
        
    }

}
