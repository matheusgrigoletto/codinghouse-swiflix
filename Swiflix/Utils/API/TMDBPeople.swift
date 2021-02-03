//
//  TMDBPeople.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 11/12/20.
//

import Foundation

struct TMDBPeople {
    
    static func getDetails(id: Int, language: String = "pt-BR", appendToResponse: String = "", completion: @escaping (_ result: PersonDetailResponse?, _ error: Error?) -> Void) {
        
        if let _key = TMDB.key {
            
            let url = "https://api.themoviedb.org/3/person/\(id)?api_key=\(_key)&language=\(language)&append_to_response=\(appendToResponse)"

            TMDB.request(url: url, method: .GET) { (popular, error) in
                completion(popular, error)
            }
            
        } else {
            completion(nil, NSError())
        }
        
    }
    
    static func getCredits(id: Int, language: String = "pt-BR", completion: @escaping (_ result: PersonCreditsResponse?, _ error: Error?) -> Void) {
        
        if let _key = TMDB.key {
            
            let url = "https://api.themoviedb.org/3/person/\(id)/combined_credits?api_key=\(_key)&language=\(language)"
            
            TMDB.request(url: url, method: .GET) { (credits, error) in
                completion(credits, error)
            }
            
        } else {
            completion(nil, NSError())
        }
        
    }
    
    static func getImages(id: Int, completion: @escaping (_ result: PersonImagesResponse?, _ error: Error?) -> Void) {
        
        if let _key = TMDB.key {
            
            let url = "https://api.themoviedb.org/3/person/\(id)/images?api_key=\(_key)"

            TMDB.request(url: url, method: .GET) { (popular, error) in
                completion(popular, error)
            }
            
        } else {
            completion(nil, NSError())
        }
        
    }
    
    static func getPopular(language: String = "pt-BR", page: Int = 1, completion: @escaping (_ result: PersonPopularResponse?, _ error: Error?) -> Void) {
        
        if let _key = TMDB.key {
            
            let url = "https://api.themoviedb.org/3/person/popular?api_key=\(_key)&language=\(language)&page=\(page)"
            print(url)
            TMDB.request(url: url, method: .GET) { (popular, error) in
                completion(popular, error)
            }
            
        } else {
            completion(nil, NSError())
        }
        
    }
    
    static func search(query: String,
                       language: String = "pt-BR",
                       page: Int = 1,
                       includeAdult: Bool = false,
                       region: String? = nil,
                       completion: @escaping (_ result: PersonPopularResponse?, _ error: Error?) -> Void) {
        
        if let _key = TMDB.key {
            var url = "https://api.themoviedb.org/3/search/person?api_key=\(_key)&language=\(language)&page=\(page)&query=\(query)&include_adult=\(includeAdult)"
            if let _region = region {
                url.append("&region=\(_region)")
            }
            print(url)
            TMDB.request(url: url, method: .GET) { (popular, error) in
                completion(popular, error)
            }
            
        } else {
            completion(nil, NSError())
        }
        
    }
    
}
