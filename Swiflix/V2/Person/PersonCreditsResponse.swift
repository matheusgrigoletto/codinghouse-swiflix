//
//  PersonCredits.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 11/12/20.
//

import Foundation

struct PersonCreditsResponse: Response {
    
    let cast: [Cast]
    let crew: [Crew]
    let id: Int
    
}
