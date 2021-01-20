//
//  Person.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 11/12/20.
//
import Foundation

struct Person: Response {
    
    let profile_path: String
    let adult: Bool
    let id: Int
    let gender: Gender
    let known_for: [KnownFor]
    let known_for_department: String
    let name: String
    let popularity: Double
    
}
