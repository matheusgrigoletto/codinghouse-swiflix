//
//  SimilarMovieResult.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 09/12/20.
//

import Foundation

struct MovieSimilarResponse: Response {
    
    let page: Int
    let results: [SimilarMovie]
    let total_pages: Int
    let total_results: Int
    
}
