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
