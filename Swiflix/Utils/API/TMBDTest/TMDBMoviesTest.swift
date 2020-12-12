//
//  TMDBMoviesTest.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 11/12/20.
//

import Foundation

struct TMDBMoviesTest {
    
    static let id = 590706
    
    static func getDetails() {
        
        TMDBMovies.getDetails(id: Self.id) { (response, error) in
            TMDBTest.printResponse(response, error)
        }
        
    }
    
    static func getTrailers() {
        
        TMDBMovies.getTrailers(id: Self.id) { (response, error) in
            TMDBTest.printResponse(response, error)
        }
        
    }
    
    static func getUpcoming() {
        
        TMDBMovies.getUpcoming { (response, error) in
            TMDBTest.printResponse(response, error)
        }
        
    }
    
    static func getNowPlaying() {
        
        TMDBMovies.getNowPlaying { (response, error) in
            TMDBTest.printResponse(response, error)
        }
        
    }
    
    static func getPopular() {
        
        TMDBMovies.getPopular { (response, error) in
            TMDBTest.printResponse(response, error)
        }
    }
    
    static func getReviews() {
        
        TMDBMovies.getReviews(id: Self.id) { (response, error) in
            TMDBTest.printResponse(response, error)
        }
        
    }
    
    static func getSimilar() {
        
        TMDBMovies.getSimilar(id: Self.id) { (response, error) in
            TMDBTest.printResponse(response, error)
        }
        
    }
    
}
