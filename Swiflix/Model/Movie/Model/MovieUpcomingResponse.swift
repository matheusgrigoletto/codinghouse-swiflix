//
//  UpcomingMovies.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 09/12/20.
//

import Foundation

struct MovieUpcomingResponse: Response {
    
    let page: Int
    let results: [PopularMedia]
    var dates: UpcomingDate?
    let total_pages: Int
    let total_results: Int
    
}
