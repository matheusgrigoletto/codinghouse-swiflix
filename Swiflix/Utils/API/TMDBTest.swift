//
//  APITest.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 09/12/20.
//

import Foundation

struct TMDBTest {
    
    static func printResponse(_ response: Any, _ error: Any) {
        print(response, error)
    }
    
    struct People {
        
        static let id = 5081
        
        static func getDetails() {
            
            TMDB.People.getDetails(id: Self.id) { (response, error) in
                TMDBTest.printResponse(response, error)
            }
            
        }
        
        static func getCredits() {
            
            TMDB.People.getCredits(id: Self.id) { (response, error) in
                TMDBTest.printResponse(response, error)
            }
            
        }
        
        static func getImages() {
            
            TMDB.People.getImages(id: Self.id) { (response, error) in
                TMDBTest.printResponse(response, error)
            }
            
        }
        
        static func getPopular() {
            
            TMDB.People.getPopular { (response, error) in
                TMDBTest.printResponse(response, error)
            }
            
        }
        
    }
    
    struct Movies {
        
        static let id = 590706
        
        static func getDetails() {
            
            TMDB.Movies.getDetails(id: Self.id) { (response, error) in
                TMDBTest.printResponse(response, error)
            }
            
        }
        
        static func getTrailers() {
            
            TMDB.Movies.getTrailers(id: Self.id) { (response, error) in
                TMDBTest.printResponse(response, error)
            }
            
        }
        
        static func getUpcoming() {
            
            TMDB.Movies.getUpcoming { (response, error) in
                TMDBTest.printResponse(response, error)
            }
            
        }
        
        static func getNowPlaying() {
            
            TMDB.Movies.getNowPlaying { (response, error) in
                TMDBTest.printResponse(response, error)
            }
            
        }
        
        static func getPopular() {
            
            TMDB.Movies.getPopular { (response, error) in
                TMDBTest.printResponse(response, error)
            }
        }
        
        static func getReviews() {
            
            TMDB.Movies.getReviews(id: Self.id) { (response, error) in
                TMDBTest.printResponse(response, error)
            }
            
        }
        
        static func getSimilar() {
            
            TMDB.Movies.getSimilar(id: Self.id) { (response, error) in
                TMDBTest.printResponse(response, error)
            }
            
        }
        
    }
    
    struct TV {
        
        static let id = 82856
        static let season = 1
        
        static func getPopular() {
            
            TMDB.TV.getSimilar(id: Self.id) { (response, error) in
                TMDBTest.printResponse(response, error)
            }
            
        }
        
        static func getDetails() {
            
            TMDB.TV.getDetails(id: Self.id) { (response, error) in
                TMDBTest.printResponse(response, error)
            }
            
        }
        
        static func getReviews() {
            
            TMDB.TV.getReviews(id: Self.id) { (response, error) in
                TMDBTest.printResponse(response, error)
            }
            
        }
        
        static func getSimilar() {
            
            TMDB.TV.getSimilar(id: Self.id) { (response, error) in
                TMDBTest.printResponse(response, error)
            }
            
        }
        
        static func getSeason() {
            
            TMDB.TV.getSeason(number: Self.season, fromSerie: Self.id) { (response, error) in
                TMDBTest.printResponse(response, error)
            }
            
        }
        
    }
    
}
