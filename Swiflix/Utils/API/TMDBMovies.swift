//
//  TMDBMovies.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 11/12/20.
//

import Foundation

class TMDBMovies {
    
    static func getDetails(id: Int, language: String = "pt-BR", appendToResponse: String = "", completion: @escaping (_ result: MediaDetailResponse?, _ error: Error?) -> Void) {
        
        if let _key = TMDB.key {
            
            let url = "https://api.themoviedb.org/3/movie/\(id)?api_key=\(_key)&language=\(language)&append_to_response=\(appendToResponse)"
            
            TMDB.request(url: url, method: .GET) { (popular, error) in
                completion(popular, error)
            }
            
        } else {
            completion(nil, NSError())
        }
        
    }
    
    static func getTrailers(id: Int, language: String = "pt-BR", completion: @escaping (_ result: MovieTrailerResponse?, _ error: Error?) -> Void) {
        
        if let _key = TMDB.key {
            
            let url = "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=\(_key)&language=\(language)"
            
            TMDB.request(url: url, method: .GET) { (popular, error) in
                completion(popular, error)
            }
            
        } else {
            completion(nil, NSError())
        }
        
    }
    
    static func getUpcoming(language: String = "pt-BR", page: Int = 1, region: String = "BR", completion: @escaping (_ result: MovieUpcomingResponse?, _ error: Error?) -> Void) {
     
        if let _key = TMDB.key {
            
            let url = "https://api.themoviedb.org/3/movie/upcoming?api_key=\(_key)&language=\(language)&region=\(region)&page=\(page)"
            
            TMDB.request(url: url, method: .GET) { (popular, error) in
                completion(popular, error)
            }
            
        } else {
            completion(nil, NSError())
        }
        
    }
    
    static func getNowPlaying(language: String = "pt-BR", page: Int = 1, region: String = "BR", completion: @escaping (_ result: MovieUpcomingResponse?, _ error: Error?) -> Void) {
        
        if let _key = TMDB.key {
            
            let url = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(_key)&language=\(language)&region=\(region)&page=\(page)"
            
            TMDB.request(url: url, method: .GET) { (popular, error) in
                completion(popular, error)
            }
            
        } else {
            completion(nil, NSError())
        }
        
    }
    
    static func getPopular(language: String = "pt-BR", page: Int = 1, region: String = "BR", completion: @escaping (_ result: MovieUpcomingResponse?, _ error: Error?) -> Void) {
        
        if let _key = TMDB.key {
            
            let url = "https://api.themoviedb.org/3/movie/popular?api_key=\(_key)&language=\(language)&region=\(region)&page=\(page)"
            
            TMDB.request(url: url, method: .GET) { (popular, error) in
                completion(popular, error)
            }
            
        } else {
            completion(nil, NSError())
        }
        
    }
    
    static func getReviews(id: Int, language: String = "pt-BR", page: Int = 1, completion: @escaping (_ result: ReviewResponse?, _ error: Error?) -> Void) {
        
        if let _key = TMDB.key {
            
            let url = "https://api.themoviedb.org/3/movie/\(id)/reviews?api_key=\(_key)&language=\(language)&page=\(page)"
            
            TMDB.request(url: url, method: .GET) { (results, error) in
                completion(results, error)
            }
            
        } else {
            completion(nil, NSError())
        }
        
    }
    
    static func getSimilar(id: Int, language: String = "pt-BR", page: Int = 1, completion: @escaping (_ result: MovieSimilarResponse?, _ error: Error?) -> Void) {
        
        if let _key = TMDB.key {
            
            let url = "https://api.themoviedb.org/3/movie/\(id)/similar?api_key=\(_key)&language=\(language)&page=\(page)"
            
            TMDB.request(url: url, method: .GET) { (results, error) in
                completion(results, error)
            }
            
        } else {
            completion(nil, NSError())
        }
        
    }
    
}
