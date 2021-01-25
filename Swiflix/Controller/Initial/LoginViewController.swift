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
        let email = emailTextField.text!
        let senha = senhaTextField.text!
        Auth.auth().signIn(withEmail: email, password: senha) { (result, error) in
            guard let isLogged = result else {
                print(error?.localizedDescription)
                let erro = error?.localizedDescription
                self.alertaDesconectado(descricaoErro: erro ?? "===NIL===ERRO===")
                return
            }
            print("=============")
            print(isLogged)
            print("=============")
            if isLogged != nil {
                //self.performSegue(withIdentifier: Segues.loginToMain, sender: nil)
                
                
                let storyboard = UIStoryboard(name: "Tabbar", bundle: nil)
                        let vc = storyboard.instantiateInitialViewController()
                        self.view.window?.rootViewController = vc
                
               
                
            }
        }
        
        
       
        
    }
    
    //MARK: - Functions
    private func configureTextFields(){
//        self.emailTextField.layer.cornerRadius = 10
//        self.emailTextField.layer.borderWidth = 2
//        self.emailTextField.layer.borderColor = UIColor.systemGray.cgColor
//        self.emailTextField.layer.masksToBounds = true
        
//        self.senhaTextField.layer.cornerRadius = 10
//        self.senhaTextField.layer.borderWidth = 2
//        self.senhaTextField.layer.borderColor = UIColor.systemGray.cgColor
        //=======
        self.emailTextField.backgroundColor = .darkGray
        self.emailTextField.attributedPlaceholder = NSAttributedString(string:"E-mail", attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        self.senhaTextField.backgroundColor = .darkGray
        self.senhaTextField.attributedPlaceholder = NSAttributedString(string:"Senha", attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
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


extension UIViewController {
    func alertaDesconectado(descricaoErro: String){
        var resultado: String
        if descricaoErro == "The password is invalid or the user does not have a password." {
            resultado = "Senha inválida ou usuário não possui senha."
        }else if descricaoErro == "The email address is badly formatted." {
            resultado = "Email incorreto ou mal formatado."
        }else if descricaoErro == "There is no user record corresponding to this identifier. The user may have been deleted."{
            resultado = "Não há usuário com este e-mail."
        }else {
            resultado = "Erro desconhecido!"
        }
        
        let refreshAlert = UIAlertController(title: "Atenção", message: resultado, preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
              //print("Handle Ok logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
    }
}
