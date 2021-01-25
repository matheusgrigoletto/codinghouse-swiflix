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
        escondeTecladoClicandoFora()
        //esconde o titulo no navigation controller
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        overrideUserInterfaceStyle = .light
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //esconde o titulo no navigation controller
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    
    //MARK: - IBActions
    @IBAction func comecarButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: Segues.toLogin, sender: nil)
    }
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: Segues.toRegister, sender: nil)
    }
    
}

