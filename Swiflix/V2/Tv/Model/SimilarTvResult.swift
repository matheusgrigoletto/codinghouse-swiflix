//
//  SimilarTv.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 09/12/20.
//

import Foundation

struct SimilarTvResult: Codable {
    
    let page: Int
    let results: [SimilarTv]
    let total_pages: Int
    let total_results: Int
    
}
