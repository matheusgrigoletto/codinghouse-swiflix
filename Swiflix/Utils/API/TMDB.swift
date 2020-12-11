//
//  API.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 09/12/20.
//

import Foundation

public struct TMDB {
    
    static var key: String?
    
    private static func request<T: Response>(url: String, method: HttpMethod, completion: @escaping (_ apiReturn: T?,_ error: Error?) -> Void) {
        
        if let _url = URL(string: url) {
            
            var urlRequest = URLRequest(url: _url)
            urlRequest.httpMethod = method.rawValue
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: urlRequest) { (data, response, error) in
                
                if let _data = data {
                    
                    do {
                        let object = try JSONDecoder().decode(T.self, from: _data)
                        completion(object, nil)
                    } catch {
                        print(try? JSONSerialization.jsonObject(with: _data, options: []))
                        completion(nil, error)
                    }
                    
                }
                
            }
            
            task.resume()
        }
        
    }
    
    struct People {
        
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
                
                TMDB.request(url: url, method: .GET) { (popular, error) in
                    completion(popular, error)
                }
                
            } else {
                completion(nil, NSError())
            }
            
        }
        
    }
    
    class Movies {
        
        static func getDetails(id: Int, language: String = "pt-BR", appendToResponse: String = "", completion: @escaping (_ result: MovieDetailResponse?, _ error: Error?) -> Void) {
            
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
    
    class TV {
        
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
        
        static func getDetails(id: Int, language: String = "pt-BR", completion: @escaping (_ result: TVDetailResponse?, _ error: Error?) -> Void) {
            
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
    
}
