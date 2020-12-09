//
//  Creator.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 08/12/20.
//

import Foundation

struct Creator: Codable {
    
    private(set) var id: Int
    private(set) var credit_id: String
    private(set) var name: String
    private(set) var gender: Int
    private(set) var profile_path: String?
    
}
