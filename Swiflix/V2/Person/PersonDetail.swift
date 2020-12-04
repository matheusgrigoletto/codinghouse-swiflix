//
//  PersonDetail.swift
//  Swiflix
//
//  Created by Bryan Barreto on 04/12/20.
//

import Foundation

struct PersonDetail {
    let profile_path:String
    let id: Int
    let name: String
    let birthday: String
    let known_for_department: String
    let deathday: String?
    let also_known_as: [String]
    let gender: Gender
    let biography: String
    let place_of_birth: String?
    let homepage: String?
    let known_for: [AnyObject]
}
