//
//  MovieTrailer.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 09/12/20.
//

import Foundation

struct MovieTrailerResponse: Response {
    
    let id: Int
    let results: [Self.MovieTrailer]
    
    struct MovieTrailer: Response {
        
        let id: String
        let iso_639_1: String
        let iso_3166_1: String
        let key: String
        let name: String
        let site: String
        let size: Int
        let type: String
        
    }
    
}
