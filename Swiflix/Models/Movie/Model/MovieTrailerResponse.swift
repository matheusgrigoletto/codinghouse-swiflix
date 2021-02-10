//
//  MovieTrailer.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 09/12/20.
//

import Foundation

struct MovieTrailerResponse: Response {
    
    let id: Int
    let results: [MovieTrailer]
    
}
