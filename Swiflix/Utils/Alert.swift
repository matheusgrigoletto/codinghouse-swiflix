//
//  Alert.swift
//  Swiflix
//
//  Created by Bryan Barreto on 24/10/20.
//

import UIKit

class Alert {
    
    
    /// Função para criar um alert padrão
    /// - Parameters:
    ///   - title: titulo do alert
    ///   - message: mensagem da mensagem
    ///   - style: estilo do alert: .actionSheet / .alert
    ///   - vc: view controller que exibirá o alert
    ///   - actions: array de UIAlertActions
    static func build(title: String, message: String, style: UIAlertController.Style, vc: UIViewController, actions:[UIAlertAction]?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        if let actions = actions {
            for action in actions {
                alert.addAction(action)
            }
        }else{
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
        }
        vc.present(alert, animated: true, completion: nil)
    }
    
    
    /// Função para exibir um alert de confirmação
    /// - Parameters:
    ///   - title: titulo do alert
    ///   - message: mensagem da mensagem
    ///   - vc: UIViewController que exibirá o alert
    ///   - destructiveAction: Caso o botão de confirmar seja destrutivo
    ///   - okActionCompletion: Função de confirmação
    ///   - cancelActionCompletion: função de cancelamento
    static func confirmAlert(title: String, message: String, vc: UIViewController, destructiveAction: Bool, okActionCompletion: (() -> Void?)?, cancelActionCompletion: (() -> Void?)?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let style: UIAlertAction.Style = destructiveAction ? .destructive : .default
        let okAction = UIAlertAction(title: "OK", style: style) { _ in
            //ok Action Code
            if let okActionCompletion = okActionCompletion {
                okActionCompletion()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { _ in
            //cancel Action Code
            if let cancelActionCompletion = cancelActionCompletion {
                cancelActionCompletion()
            }
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        vc.present(alert, animated: true, completion: nil)
    }
}
