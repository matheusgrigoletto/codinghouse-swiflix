//
//  LoginViewController.swift
//  Swiflix
//
//  Created by Bryan Barreto on 24/10/20.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift


class LoginViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    

    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTextFields()
        self.configureDelegates()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    


    func configureDelegates(){
        self.emailTextField.delegate = self
        self.senhaTextField.delegate = self
    }
    
    //MARK: - IBAction
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: Segues.loginToMain, sender: nil)
    }
    
    //MARK: - Functions
    private func configureTextFields(){
        self.emailTextField.layer.cornerRadius = 10
        self.emailTextField.layer.borderWidth = 2
        self.emailTextField.layer.borderColor = UIColor.systemGray.cgColor
        self.emailTextField.layer.masksToBounds = true
        
        self.senhaTextField.layer.cornerRadius = 10
        self.senhaTextField.layer.borderWidth = 2
        self.senhaTextField.layer.borderColor = UIColor.systemGray.cgColor
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.validate(caracters: 6)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}

extension UITextField {
    func validate(caracters: Int){
        if self.text?.count ?? 0 < caracters {
            self.layer.borderColor = UIColor.red.cgColor
        }else{
            self.layer.borderColor = UIColor.green.cgColor
        }
    }
}

//MARK: - Funcao Recolher Teclado
extension UIViewController{
    @objc func escondeTecladoClicandoFora(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.escondeTeclado))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func escondeTeclado(){
        view.endEditing(true)
    }
    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
}
