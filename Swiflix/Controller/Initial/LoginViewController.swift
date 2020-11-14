//
//  LoginViewController.swift
//  Swiflix
//
//  Created by Bryan Barreto on 24/10/20.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    

    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTextFields()
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
    
}
