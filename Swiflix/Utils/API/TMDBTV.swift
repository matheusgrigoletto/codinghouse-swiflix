//
//  TMDBTV.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 11/12/20.
//

import Foundation

struct TMDBTV {
    
    static func getPopular(language: String = "pt-BR", page: Int = 1, completion: @escaping (_ result: TVPopularResponse?, _ error: Error?) -> Void) {
        
        if let _key = TMDB.key {
            
            let url = "https://api.themoviedb.org/3/tv/popular?api_key=\(_key)&language=\(language)&page=\(page)"
            
            TMDB.request(url: url, method: .GET) { (popular, error) in
                completion(popular, error)
            }
            
        } else {
            completion(nil, NSError())
        }
        
    }
    
    static func getDetails(id: Int, language: String = "pt-BR", completion: @escaping (_ result: MediaDetailResponse?, _ error: Error?) -> Void) {
        
        if let _key = TMDB.key {
            
            let url = "https://api.themoviedb.org/3/tv/\(id)?api_key=\(_key)&language=\(language)"
            
            TMDB.request(url: url, method: .GET) { (detail, error) in
                completion(detail, error)
            }
            
        } else {
            completion(nil, NSError())
        }
        
    }
    
    static func getReviews(id: Int, language: String = "pt-BR", page: Int = 1, completion: @escaping (_ result: ReviewResponse?, _ error: Error?) -> Void) {
        
        if let _key = TMDB.key {
            
            let url = "https://api.themoviedb.org/3/tv/\(id)/reviews?api_key=\(_key)&language=\(language)&page=\(page)"
            
            TMDB.request(url: url, method: .GET) { (results, error) in
                completion(results, error)
            }
            
        } else {
            completion(nil, NSError())
        }
        
    }
    
    static func getSimilar(id: Int, language: String = "pt-BR", page: Int = 1, completion: @escaping (_ result: TVSimilarResponse?, _ error: Error?) -> Void) {
        
        if let _key = TMDB.key {
            
            let url = "https://api.themoviedb.org/3/tv/\(id)/similar?api_key=\(_key)&language=\(language)&page=\(page)"
            
            TMDB.request(url: url, method: .GET) { (results, error) in
                completion(results, error)
            }
            
        } else {
            completion(nil, NSError())
        }
        
    }
    
    static func getSeason(number season_number: Int, fromSerie tv_id: Int, language: String = "pt-BR", completion: @escaping (_ result: TVSeasonResponse?, _ error: Error?) -> Void) {
        
        if let _key = TMDB.key {
            
            let url = "https://api.themoviedb.org/3/tv/\(tv_id)/season/\(season_number)?api_key=\(_key)&language=\(language)"
            
            TMDB.request(url: url, method: .GET) { (results, error) in
                completion(results, error)
            }
            
        } else {
            completion(nil, NSError())
        }
        
    }
    
}
