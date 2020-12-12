//
//  TMDBTVTest.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 11/12/20.
//

import Foundation

struct TMDBTVTest {
    
    static let id = 82856
    static let season = 1
    
    static func getPopular() {
        
        TMDBTV.getSimilar(id: Self.id) { (response, error) in
            TMDBTest.printResponse(response, error)
        }
        
    }
    
    static func getDetails() {
        
        TMDBTV.getDetails(id: Self.id) { (response, error) in
            TMDBTest.printResponse(response, error)
        }
        
    }
    
    static func getReviews() {
        
        TMDBTV.getReviews(id: Self.id) { (response, error) in
            TMDBTest.printResponse(response, error)
        }
        
    }
    
    static func getSimilar() {
        
        TMDBTV.getSimilar(id: Self.id) { (response, error) in
            TMDBTest.printResponse(response, error)
        }
        
    }
    
    static func getSeason() {
        
        TMDBTV.getSeason(number: Self.season, fromSerie: Self.id) { (response, error) in
            TMDBTest.printResponse(response, error)
        }
        
    }
    
}
