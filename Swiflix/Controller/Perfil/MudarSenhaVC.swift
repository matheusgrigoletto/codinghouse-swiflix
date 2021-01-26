//
//  MudarSenhaVC.swift
//  Swiflix
//
//  Created by Bruno Horta on 25/1/21.
//

import UIKit
import Firebase

class MudarSenhaVC: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var bttEnviar: UIButton!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loadStyle()

    }
    
    @IBAction func bttCancelar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func bttEnviar(_ sender: UIButton) {
        Auth.auth().sendPasswordReset(withEmail: emailTextField.text ?? "") { (erro) in
            if let erro = erro {
                print(erro.localizedDescription)
                return
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)){
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
       
        
    }
    
    func loadStyle(){
        bttEnviar.layer.cornerRadius = bttEnviar.layer.frame.height / 4
        emailTextField.placeholder = "Insira seu E-mail"
        emailTextField.textColor = .black
        emailTextField.backgroundColor = .darkGray
        
    }

}
