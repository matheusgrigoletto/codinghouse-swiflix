//
//  Person.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 31/10/20.
//

import Foundation

struct Person: Codable {
    
    var birthday: String?
    var knownForDepartment: String?
    var deathday: String?
    var id: Int?
    var name: String?
    var alsoKnownAs: [String]?
    var gender: Int?
    var biography: String?
    var popularity: Double?
    var placeOfBirth: String?
    var profilePath: String?
    var adult: Bool?
    var imdbId: String?
    var homepage: String?
    
    enum CodingKeys: String, CodingKey {
        case knownForDepartment = "known_for_department"
        case alsoKnownAs = "also_known_as"
        case placeOfBirth = "place_of_birth"
        case profilePath = "profile_path"
        case imdbId = "imdb_id"
    }
    
}
