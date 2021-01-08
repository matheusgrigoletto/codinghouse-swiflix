//
//  TMDBPeopleTest.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 11/12/20.
//

import Foundation

struct TMDBPeopleTest {
    
    static let id = 5081
    
    static func getDetails() {
        
        TMDBPeople.getDetails(id: Self.id) { (response, error) in
            TMDBTest.printResponse(response, error)
        }
        
    }
    
    static func getCredits() {
        
        TMDBPeople.getCredits(id: Self.id) { (response, error) in
            TMDBTest.printResponse(response, error)
        }
        
    }
    
    static func getImages() {
        
        TMDBPeople.getImages(id: Self.id) { (response, error) in
            TMDBTest.printResponse(response, error)
        }
        
    }
    
    static func getPopular() {
        
        TMDBPeople.getPopular { (response, error) in
            TMDBTest.printResponse(response, error)
        }
        
    }
    
}
