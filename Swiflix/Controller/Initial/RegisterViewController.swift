//
//  RegisterViewController.swift
//  Swiflix
//
//  Created by Bryan Barreto on 24/10/20.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift


class RegisterViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var photoButton: UIImageView!
   // @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmarEmailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var confirmarSenhaTextField: UITextField!
    @IBOutlet weak var cadastrarButton: UIButton!
    
    
    var imagePicker = UIImagePickerController()
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        
        nomeTextField.delegate = self
        emailTextField.delegate = self
        confirmarEmailTextField.delegate = self
        senhaTextField.delegate = self
        confirmarSenhaTextField.delegate = self
        
        configurePhotoButton()

        super.viewDidLoad()
        
        escondeTecladoClicandoFora()
        configureValidation()
               
    }
    
  
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    
    
 
    //MARK: - Cofigurating Functions

    
    func configurePhotoButton(){
        photoButton.layer.borderWidth = 1
        photoButton.layer.masksToBounds = false
        photoButton.layer.borderColor = UIColor.black.cgColor
        photoButton.layer.cornerRadius = photoButton.frame.height/2
        photoButton.clipsToBounds = true
    }
    
    
    func configureValidation(){
        nomeTextField.backgroundColor = .darkGray
        nomeTextField.attributedPlaceholder = NSAttributedString(string:"Nome Completo", attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        emailTextField.backgroundColor = .darkGray
        emailTextField.attributedPlaceholder = NSAttributedString(string:"E-mail", attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        confirmarEmailTextField.backgroundColor = .darkGray
        confirmarEmailTextField.attributedPlaceholder = NSAttributedString(string:"Repita o E-mail", attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        senhaTextField.backgroundColor = .darkGray
        senhaTextField.attributedPlaceholder = NSAttributedString(string:"Senha", attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        confirmarSenhaTextField.backgroundColor = .darkGray
        confirmarSenhaTextField.attributedPlaceholder = NSAttributedString(string:"Repita a Senha", attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
    }
    
     func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if textField.text != ""{
            //textField.backgroundColor = .white
            textField.textColor = .white
            textField.layer.borderWidth = 2
            textField.layer.borderColor = CGColor.init(red: 0, green: 255, blue: 0, alpha: 75)
            
        }else{
            //textField.backgroundColor = .darkGray
            textField.textColor = .black
            textField.layer.borderWidth = 2
            textField.layer.borderColor = CGColor.init(red: 255, green: 0, blue: 0, alpha: 75)
        }

//        if confirmarEmailTextField.isSelected == true {
//            if self.confirmarEmailTextField != self.emailTextField{
//                alertaEmail()
//            }
        }
    
    private func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {
         
         if UIImagePickerController.isSourceTypeAvailable(sourceType) {
             
             let imagePickerController = UIImagePickerController()
             imagePickerController.delegate = self
             imagePickerController.sourceType = sourceType
            imagePickerController.allowsEditing = true
             
             self.present(imagePickerController, animated: true, completion: nil)
             
         }
         
     }
    
    
    
    //MARK: - IBActions
    
    @IBAction func cadastrarButtonTapped(_ sender: UIButton) {
         //TODO: Implementar função de criar novo usuário aqui
        
        let nome = nomeTextField.text!
        let email = emailTextField.text!
        let password = senhaTextField.text!
        
        if checkField(f1: emailTextField.text ?? "email1", f2: confirmarEmailTextField.text ?? "email2") == false {
            emailTextField.textColor = UIColor.red
            confirmarEmailTextField.textColor = UIColor.red
            alertaEmail()
        }
        if checkField(f1: senhaTextField.text ?? "s1", f2: confirmarSenhaTextField.text ?? "s2") == false {
            senhaTextField.textColor = UIColor.red
            senhaTextField.textColor = UIColor.red
            alertaSenha()
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard let result = result else {
                let erro = error?.localizedDescription
                print(error?.localizedDescription)
                self.alertaDesconectado(descricaoErro: erro ?? "===NIL===ERRO===")
                return
            }
            
            let usuario: [String: Any] = ["nome": nome]
            
            print(result.user.uid)
            
            Firestore.firestore().collection("usuario").document(result.user.uid).setData(usuario) { (erro) in
                guard erro == nil else{
                    print(erro?.localizedDescription)
                    return
                }
                
                
            }
            
            var isLogged = result.user.uid
            if isLogged != nil {
                
                let storyboard = UIStoryboard(name: "Tabbar", bundle: nil)
                        let vc = storyboard.instantiateInitialViewController()
                        self.view.window?.rootViewController = vc
                
            }
        }
        
        
    }
    
    
    @IBAction func chooseImageButtonTapped(_ sender: UIButton) {
        
        self.getImage(fromSourceType: .photoLibrary)
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    //MARK: - Functions
    
    
    func campoVazio(){
        let emptyField = UIAlertController(title: "Atenção", message: "Preencha todos os campos.", preferredStyle: UIAlertController.Style.alert)
        
        emptyField.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
        }))
        present(emptyField, animated: true, completion: nil)
    }
    
    func alertaEmail(){
        let refreshAlert = UIAlertController(title: "Atenção", message: "Os e-mails não conferem!", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
              //print("Handle Ok logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
    }
    
    func alertaSenha(){
        let refreshAlert = UIAlertController(title: "Atenção", message: "As senhas não conferem!", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
              //print("Handle Ok logic here")
        }))
        present(refreshAlert, animated: true, completion: nil)
    }

  
    
}




extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
            switch textField {
            case self.nomeTextField:
                self.emailTextField.becomeFirstResponder()
            case self.emailTextField:
                self.confirmarEmailTextField.becomeFirstResponder()
            case self.confirmarEmailTextField:
                self.senhaTextField.becomeFirstResponder()
            case self.senhaTextField:
                self.confirmarSenhaTextField.becomeFirstResponder()
            case self.confirmarSenhaTextField:
                self.confirmarSenhaTextField.resignFirstResponder()
            default:break
            }
    
            return true
        }
}


//MARK: UIImagePickerControllerDelegate UINavigationControllerDelegate
extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let imageURL = info[UIImagePickerController.InfoKey.referenceURL] as! NSURL
        
        let urlImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage

        
        
        photoButton.image = urlImage
        
       // self.photoButton.layer.cornerRadius = 100
        
        
        print("urlImage:\(urlImage)")
        
        print("=========\(info)")
        picker.dismiss(animated: true, completion: nil)
        
    }
}

extension UIImageView {

    func makeRounded() {

        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

extension UIViewController {
    func checkField(f1: String, f2: String) -> Bool{
        if f1 != f2 {
            return false
        }else {
            return true
        }
    }
    
}
