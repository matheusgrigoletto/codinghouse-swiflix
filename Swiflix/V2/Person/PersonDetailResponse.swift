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
    let gender: Gender
    let biography: String
    let popularity: Double
    let place_of_birth: String?
    let profile_path:String?
    let adult: Bool
    let imdb_id: String
    let homepage: String?
    
    var asFullPerson: FullPerson {
        get {
            return FullPerson(birthday: self.birthday ?? "",
                              deathday: self.deathday,
                              name: self.name,
                              biography: self.biography,
                              place_of_birth: self.place_of_birth ?? "",
                              profile_path: self.profile_path ?? "",
                              known_for_department: self.known_for_department)
        }
    }
    
}
