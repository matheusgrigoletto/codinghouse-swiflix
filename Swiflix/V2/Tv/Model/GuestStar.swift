//
//  GuestStar.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 11/12/20.
//

import Foundation

struct GuestStar: Response {

    let credit_id: String
    let order: Int
    let character: String
    let adult: Bool
    let gender: Gender?
    let id: Int
    let known_for_department: String
    let name: String
    let original_name: String
    let popularity: Double
    let profile_path: String?

}
