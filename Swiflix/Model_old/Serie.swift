//
//  Serie.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 12/11/20.
//

import Foundation

//TODO: Apagar classe (Substituida por DetailTv)
struct Serie {
    let backdrop: String
    let genres:[Genres]
    let homePage: String?
    let id: Int
    let originalTitle: String
    let overview: String
    let poster: String
    let releaseDate: String
    let runtime: Int?
    let title: String
    let vote: Double
    
}
