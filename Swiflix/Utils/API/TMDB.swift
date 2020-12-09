//
//  API.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 09/12/20.
//

import Foundation

struct TMDB {
    
    static var key: String?
    
    private static func request<T: Codable>(url: String, method: HttpMethod, completion: @escaping (_ apiReturn: T?,_ error: Error?) -> Void) {
        
        if let _url = URL(string: url) {
            
            var urlRequest = URLRequest(url: _url)
            urlRequest.httpMethod = method.rawValue
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: urlRequest) { (data, response, error) in
                
                if let _data = data {
                    
                    do {
                        //                        print(try JSONSerialization.jsonObject(with: _data, options: []))
                        let object = try JSONDecoder().decode(T.self, from: _data)
                        completion(object, nil)
                    } catch {
                        completion(nil, error)
                    }
                    
                }
                
            }
            
            task.resume()
        }
        
    }
    
    class TV {
        
        static func getPopular(language: String = "pt-BR", page: Int = 1, completion: @escaping (_ result: TvResults?, _ error: Error?) -> Void) {
            
            if let _key = TMDB.key {
                
                let url = "https://api.themoviedb.org/3/tv/popular?api_key=\(_key)&language=\(language)&page=\(page)"
                
                TMDB.request(url: url, method: .GET) { (popular, error) in
                    completion(popular, error)
                }
                
            } else {
                completion(nil, NSError())
            }
            
        }
        
        static func getDetails(id: Int, language: String = "pt-BR", completion: @escaping (_ result: DetailTv?, _ error: Error?) -> Void) {
            
            if let _key = TMDB.key {
                
                let url = "https://api.themoviedb.org/3/tv/\(id)?api_key=\(_key)&language=\(language)"
                
                TMDB.request(url: url, method: .GET) { (detail, error) in
                    completion(detail, error)
                }
                
            } else {
                completion(nil, NSError())
            }
            
        }
        
        static func getReviews(id: Int, language: String = "pt-BR", page: Int = 1, completion: @escaping (_ result: ReviewResult?, _ error: Error?) -> Void) {
            
            if let _key = TMDB.key {
                
                let url = "https://api.themoviedb.org/3/tv/\(id)/reviews?api_key=\(_key)&language=\(language)&page=\(page)"
                
                TMDB.request(url: url, method: .GET) { (results, error) in
                    completion(results, error)
                }
                
            } else {
                completion(nil, NSError())
            }
            
        }
        
        static func getSimilar(id: Int, language: String = "pt-BR", page: Int = 1, completion: @escaping (_ result: SimilarTvResult?, _ error: Error?) -> Void) {
            
            if let _key = TMDB.key {
                
                let url = "https://api.themoviedb.org/3/tv/\(id)/similar?api_key=\(_key)&language=\(language)&page=\(page)"
                
                TMDB.request(url: url, method: .GET) { (results, error) in
                    completion(results, error)
                }
                
            } else {
                completion(nil, NSError())
            }
            
        }
        
        static func getSeason(number season_number: Int, fromSerie tv_id: Int, language: String = "pt-BR", completion: @escaping (_ result: TvSeason?, _ error: Error?) -> Void) {
            
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
    
}
