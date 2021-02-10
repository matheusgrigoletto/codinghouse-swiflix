//
//  Reviews.swift
//  Swiflix
//
//  Created by Bryan Barreto on 04/12/20.
//

import Foundation

struct Review: Response {

    let author: String
    let author_details: AuthorDetails
    let content: String
    let created_at: String
    let id: String
    let updated_at: String
    let url: String
    
    var asReviews: Reviews {
        get {
            return Reviews(author: self.author,
                           content: self.content)
        }
    }


}
