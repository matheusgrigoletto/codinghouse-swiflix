//
//  Image.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 11/12/20.
//

import Foundation

struct Image: Response {
    
    let aspect_ratio: Double
    let file_path: String
    let height: Int
    let iso_639_1: String?
    let vote_average: Double
    let vote_count: Int
    let width: Int
    
}
