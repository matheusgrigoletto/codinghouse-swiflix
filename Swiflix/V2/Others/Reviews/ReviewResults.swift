//
// Created by Erik Radicheski da Silva on 08/12/20.
//

import Foundation

struct ReviewResponse: Response {

    let id: Int
    let page: Int
    let results: [Self.Review]
    let total_pages: Int
    let total_results: Int
    
    struct Review: Response {

        let author: String
        let author_details: Self.AuthorDetails
        let content: String
        let created_at: String
        let id: String
        let updated_at: String
        let url: String
        
        struct AuthorDetails: Response {

            let name: String
            let username: String
            let avatar_path: String?
            let rating: Int?

        }


    }

}
