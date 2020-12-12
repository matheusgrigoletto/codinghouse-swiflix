//
//  PersonResult.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 09/12/20.
//

import Foundation

struct PersonPopularResponse: Response {
    
    let page: Int
    let results: [Person]
    let total_results: Int
    let total_pages: Int
    
}
