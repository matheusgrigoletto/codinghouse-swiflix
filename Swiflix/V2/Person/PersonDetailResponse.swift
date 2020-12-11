//
//  PersonDetail.swift
//  Swiflix
//
//  Created by Bryan Barreto on 04/12/20.
//

import Foundation

struct PersonDetailResponse: Response {
    
    let birthday: String?
    let known_for_department: String
    let deathday: String?
    let id: Int
    let name: String
    let also_known_as: [String]
    let gender: Self.Gender
    let biography: String
    let popularity: Double
    let place_of_birth: String?
    let profile_path:String?
    let adult: Bool
    let imdb_id: String
    let homepage: String?
    
    enum Gender: Int, Response {
        
        case Outro = 0
        case Feminino = 1
        case Masculino = 2
        
    }
    
}
