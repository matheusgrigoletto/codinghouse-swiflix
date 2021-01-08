//
// Created by Erik Radicheski da Silva on 08/12/20.
//

import Foundation

struct ReviewResponse: Response {

    let id: Int
    let page: Int
    let results: [Review]
    let total_pages: Int
    let total_results: Int

}
