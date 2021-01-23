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
    override func layoutSubviews() {
        super.layoutSubviews()
        self.galleryImageView.layer.cornerRadius = 20
        self.contentView.layer.cornerRadius = 20
        
    }
    func setup(_ gallery: PersonPhotoGallery){
        self.galleryImageView.withMediaURL(gallery.file_path)
    }

}
