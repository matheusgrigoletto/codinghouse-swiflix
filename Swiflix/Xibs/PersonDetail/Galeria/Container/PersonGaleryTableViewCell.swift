//
//  GaleryTableViewCell.swift
//  Swiflix
//
//  Created by Vanessa Montagner on 10/11/20.
//

import UIKit

protocol PersonGaleryTableViewCellDelegate {
    func tappedPhoto(file_path: String)
}

class PersonGaleryTableViewCell: UITableViewCell {
    
    static let nibName: String = "PersonGaleryTableViewCell"
    static let cellID: String = "PersonGaleryTableViewCell"
    
    var photoClickDelegate: PersonGaleryTableViewCellDelegate?
    
    var gallery:[PersonPhotoGallery]?
    
    @IBOutlet weak var galleryCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureCollectionCell()
    }
    
    func configureCollectionCell(){
        let nib = UINib(nibName: GalleryCollectionViewCell.nibName, bundle: nil)
        self.galleryCollection.register(nib, forCellWithReuseIdentifier: GalleryCollectionViewCell.cellID)
        
        self.galleryCollection.dataSource = self
        self.galleryCollection.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(_ gallery: [PersonPhotoGallery]){
        self.gallery = gallery
    }
}

extension PersonGaleryTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.gallery?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.cellID, for: indexPath) as? GalleryCollectionViewCell
        cell?.setup(self.gallery?[indexPath.row] ?? PersonPhotoGallery(file_path: "erro"))
        return cell ?? UICollectionViewCell()
    }
}

extension PersonGaleryTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.photoClickDelegate?.tappedPhoto(file_path: self.gallery?[indexPath.row].file_path ?? "")
    }
    
}


