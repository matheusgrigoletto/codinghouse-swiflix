//
//  GaleryTableViewCell.swift
//  Swiflix
//
//  Created by Vanessa Montagner on 10/11/20.
//

import UIKit

class PersonGaleryTableViewCell: UITableViewCell {
    
    static let nibName: String = "PersonGaleryTableViewCell"
    static let cellID: String = "PersonGaleryTableViewCell"
    
    @IBOutlet weak var galleryCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let nib = UINib(nibName: GalleryCollectionViewCell.nibName, bundle: nil)
        self.galleryCollection.register(nib, forCellWithReuseIdentifier: GalleryCollectionViewCell.cellID)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(_ gallery: [PersonPhotoGallery]){
        
    }
    
}
