//
//  UserProfile.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 06/02/21.
//

import UIKit

struct UserProfile {
    
    static var shared: UserProfile = {
        let userProfile = UserProfile()
        return userProfile
    }()
    
    var image: UIImage?
    
    private init() {}
    
}
