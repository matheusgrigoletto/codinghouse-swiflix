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
        
        
        photoButton.layer.borderWidth = 1
        photoButton.layer.masksToBounds = false
        photoButton.layer.borderColor = UIColor.black.cgColor
        photoButton.layer.cornerRadius = photoButton.frame.height/2
        photoButton.clipsToBounds = true
        
        
        
        super.viewDidLoad()
        escondeTecladoClicandoFora()
        
        nomeTextField.backgroundColor = .white
        emailTextField.backgroundColor = .white
        confirmarEmailTextField.backgroundColor = .white
        senhaTextField.backgroundColor = .white
        confirmarSenhaTextField.backgroundColor = .white
        
        
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

   
    
     func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if textField.text != ""{
            textField.backgroundColor = .white
        }else{
            textField.backgroundColor = .systemGray
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
             
             self.present(imagePickerController, animated: true, completion: nil)
             
         }
         
     }
    
    
    
    //MARK: - IBActions
    
    @IBAction func cadastrarButtonTapped(_ sender: UIButton) {
         //TODO: Implementar função de criar novo usuário aqui
        
        
    }
    @IBAction func chooseImageButtonTapped(_ sender: UIButton) {
        
        self.getImage(fromSourceType: .photoLibrary)
        present(imagePicker, animated: true, completion: nil)
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
        
        let urlImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage

        
        
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
