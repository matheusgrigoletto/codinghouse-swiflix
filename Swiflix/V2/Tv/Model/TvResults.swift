//
//  TvResults.swift
//  Swiflix
//
//  Created by Bryan Barreto on 04/12/20.
//

import Foundation

struct TvResults: Codable {

    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [Tv]

}
