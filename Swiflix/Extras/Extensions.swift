//
//  Extensions.swift
//  Swiflix
//
//  Created by Bryan Barreto on 23/01/21.
//

import UIKit
import Kingfisher

extension UIImageView {
    func withMediaURL(_ url: String){
        guard let url = URL(string: Utils.baseImageURL + url) else {
            self.image = UIImage(systemName: "nosign")
            return
        }
        
        self.kf.setImage(with: url, placeholder: UIImage(systemName: "nosign"), options: nil, completionHandler: nil)
    }
}
