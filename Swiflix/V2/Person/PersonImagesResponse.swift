//
//  PersonImages.swift
//  Swiflix
//
//  Created by Bryan Barreto on 04/12/20.
//

import Foundation

struct PersonImagesResponse: Response {
    
    let id: Int
    let profiles: [Self.Image]
    
    struct Image: Response {
        
        let aspect_ratio: Double
        let file_path: String
        let height: Int
        let iso_639_1: String?
        let vote_average: Double
        let vote_count: Int
        let width: Int
        
    }
    
}
