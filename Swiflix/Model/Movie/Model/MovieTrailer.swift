//
//  MovieTrailer.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 11/12/20.
//

import Foundation

struct MovieTrailer: Response {
    
    let id: String
    let iso_639_1: String
    let iso_3166_1: String
    let key: String
    let name: String
    let site: String
    let size: Int
    let type: String
    
    var asMovieTrailler: MovieTrailler {
        get {
            return MovieTrailler(name: self.name,
                                 key: self.key,
                                 site: self.site,
                                 type: self.type)
        }
    }
    
}
