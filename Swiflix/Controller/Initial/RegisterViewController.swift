//
//  RegisterViewController.swift
//  Swiflix
//
//  Created by Bryan Barreto on 24/10/20.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate {

    //MARK: - IBOutlets
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmarEmailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var confirmarSenhaTextField: UITextField!
    @IBOutlet weak var cadastrarButton: UIButton!
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        
        nomeTextField.delegate = self
        emailTextField.delegate = self
        confirmarEmailTextField.delegate = self
        senhaTextField.delegate = self
        confirmarSenhaTextField.delegate = self
        
        
        
        super.viewDidLoad()
        escondeTecladoClicandoFora()
        
        nomeTextField.backgroundColor = .systemGray
        emailTextField.backgroundColor = .systemGray
        confirmarEmailTextField.backgroundColor = .systemGray
        senhaTextField.backgroundColor = .systemGray
        confirmarSenhaTextField.backgroundColor = .systemGray
        
        
    }
    
  
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.nomeTextField {
            self.nomeTextField.backgroundColor = .white
            self.nomeTextField.textColor = .black
        } else if textField == self.emailTextField {
            self.emailTextField.backgroundColor = .white
            self.emailTextField.textColor = .black
        } else if textField == self.confirmarEmailTextField {
            self.confirmarEmailTextField.backgroundColor = .white
            self.confirmarEmailTextField.textColor = .black
        } else if textField == self.senhaTextField {
            self.senhaTextField.backgroundColor = .white
            self.senhaTextField.textColor = .black
        } else if textField == self.confirmarSenhaTextField {
            self.confirmarSenhaTextField.backgroundColor = .white
            self.confirmarSenhaTextField.textColor = .black
        }
    }
    
    
//MARK: - Tentativa de validar email
    //Validar TextFields emails iguais e senhas iguais
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if textField == self.confirmarEmailTextField{}
//            if self.confirmarEmailTextField != self.emailTextField{
//                alertaEmail()
//            }
//        }
//

   
    
//     func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
//        textField.backgroundColor = .systemGray
//
//        if confirmarEmailTextField.isSelected == true {
//            if self.confirmarEmailTextField != self.emailTextField{
//                alertaEmail()
//            }
//        }
    
//     }
    
    
    //MARK: - IBActions
    
    @IBAction func cadastrarButtonTapped(_ sender: UIButton) {
         //TODO: Implementar função de criar novo usuário aqui
        
    }
    @IBAction func chooseImageButtonTapped(_ sender: UIButton) {
    }
    
    
    //MARK: - Functions
    
    
    func alertaEmail(){
        let refreshAlert = UIAlertController(title: "Atenção", message: "Os e-mails não conferem!", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
              //print("Handle Ok logic here")
        }))

//        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
//              print("Handle Cancel Logic here")
//        }))

        present(refreshAlert, animated: true, completion: nil)
    }
}
