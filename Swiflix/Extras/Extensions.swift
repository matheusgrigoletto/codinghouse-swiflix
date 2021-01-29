//
//  Extensions.swift
//  Swiflix
//
//  Created by Bryan Barreto on 23/01/21.
//

import UIKit
import Kingfisher

typealias AlertActionCompletionHandler = ((UIAlertAction) -> Void)?

extension UIImageView {
    func withMediaURL(_ url: String){
        guard let url = URL(string: Utils.baseImageURL + url) else {
            self.image = UIImage(systemName: "nosign")
            return
        }
        
        self.kf.setImage(with: url, placeholder: UIImage(systemName: "nosign"), options: [.transition(.fade(1))], completionHandler: nil)
    }
}

extension UIViewController {
    func showConfirmAlert(title: String?, message: String?, okHandler: AlertActionCompletionHandler, cancelHandler: AlertActionCompletionHandler){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Sim", style: .default, handler: okHandler)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: cancelHandler)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String?, message: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}
