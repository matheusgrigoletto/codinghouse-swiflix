//
//  RegisterViewController.swift
//  Swiflix
//
//  Created by Bryan Barreto on 24/10/20.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmarEmailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var confirmarSenhaTextField: UITextField!
    @IBOutlet weak var cadastrarButton: UIButton!
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBActions
    @IBAction func cadastrarButtonTapped(_ sender: UIButton) {
         //TODO: Implementar função de criar novo usuário aqui
        
    }
    @IBAction func chooseImageButtonTapped(_ sender: UIButton) {
    }
    
    //MARK: - Functions
}
