//
//  API.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 09/12/20.
//

import Foundation

struct TMDB {
    
    static var key: String?
    
    static func request<T: Response>(url: String, method: HttpMethod, completion: @escaping (_ apiReturn: T?,_ error: Error?) -> Void) {
        
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
//                        print(try? JSONSerialization.jsonObject(with: _data, options: []))
                        completion(nil, error)
                    }
                    
                }
                
            }
            
            task.resume()
        }
        
    }
    
}
