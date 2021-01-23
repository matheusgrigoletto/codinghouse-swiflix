//
//  GalleryCollectionViewCell.swift
//  Swiflix
//
//  Created by Bryan Barreto on 14/11/20.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var galleryImageView: UIImageView!
    
    static let nibName: String = "GalleryCollectionViewCell"
    static let cellID: String = "galleryCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(_ gallery: PersonPhotoGallery){
        self.galleryImageView.withMediaURL(gallery.file_path)
    }

}
