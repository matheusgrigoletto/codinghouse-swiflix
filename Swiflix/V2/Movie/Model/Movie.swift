//
//  Movie.swift
//  Swiflix
//
//  Created by Bryan Barreto on 04/12/20.
//

import Foundation

struct Movie: Codable {
    
    let title: String
    let original_title:String
    let poster_path:String
    let id: Int
    let backdrop_path:String
    let vote_average:Double
    let overview: String
    
}
