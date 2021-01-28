//
//  InitialViewController.swift
//  Swiflix
//
//  Created by Bryan Barreto on 24/10/20.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift


class InitialViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var comecarButton: UIButton!
    

    //MARK: - ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        isLogged()
        escondeTecladoClicandoFora()
        
        overrideUserInterfaceStyle = .light
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let _ = Auth.auth().currentUser {
            let storyboard = UIStoryboard(name: "Tabbar", bundle: nil)
            if let vc = storyboard.instantiateInitialViewController() {
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false, completion: nil)
            }
        }
    }
    
    func isLogged(){
        if Auth.auth().currentUser?.uid != nil {
            let storyboard = UIStoryboard(name: "Tabbar", bundle: nil)
                    let vc = storyboard.instantiateInitialViewController()
                    self.view.window?.rootViewController = vc
            print("UserLogged")
        }else {
            performSegue(withIdentifier: Segues.toLogin, sender: nil)
            print("NO USER LOGGED")
        }
    }
    
    
    //MARK: - IBActions
    @IBAction func comecarButtonTapped(_ sender: UIButton) {
        isLogged()
    }
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: Segues.toRegister, sender: nil)
    }
    
}

