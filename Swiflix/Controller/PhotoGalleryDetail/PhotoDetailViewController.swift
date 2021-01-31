//
//  PhotoDetailViewController.swift
//  Swiflix
//
//  Created by Bryan Barreto on 15/11/20.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var photoString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showImage()
        self.title = "Galeria"
    }
   
    @IBAction func saveImage(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Deseja salvar esta imagem?", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Sim", style: .default) { _ in
            UIImageWriteToSavedPhotosAlbum(self.imageView.image!, self, #selector(self.image(_:didFinishSavingWithError:contextInfo:)), nil)
        }
        
        let cancel = UIAlertAction(title: "Não", style: .cancel) { _ in
//            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(ok)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Erro", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Sucesso!", message: "A imagem foi salva na sua galeria", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    func showImage(){
        if let imageURL = URL(string: "\(Utils.baseImageURL)\(self.photoString!)"){
            do{
                let imageData = try Data(contentsOf: imageURL)
                self.imageView.image = UIImage(data: imageData)
            }catch{
                print("error getting image data")
            }
        }
    }

}
