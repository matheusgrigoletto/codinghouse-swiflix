//
// Created by Erik Radicheski da Silva on 08/12/20.
//

import Foundation

struct ReviewResult: Codable {

    let id: Int
    let page: Int
    let results: [Review]
    let total_pages: Int
    let total_results: Int

}
