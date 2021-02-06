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
    
    var gallery:[Image]?
    
    
    @IBOutlet weak var galleryCollection: UICollectionView!
    
    let spacing: CGFloat = 10
    
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
    
    func setup(_ gallery: [Image]){
        self.gallery = gallery
    }
    
    func spacingTotal() -> CGSize{
        let numberOfItemsPerRow:CGFloat = 3
        let spacingBetweenCells:CGFloat = 6
        
                
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
                
        if let collection = self.galleryCollection{
                    let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                    return CGSize(width: width, height: width)
                }else{
                    return CGSize(width: 0, height: 0)
                }
    }
}

extension PersonGaleryTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.gallery?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.cellID, for: indexPath) as? GalleryCollectionViewCell
        cell?.setup(self.gallery?[indexPath.row].asPersonPhotoGallery ?? PersonPhotoGallery(file_path: "erro"))
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {


        return spacingTotal()
    }
    

}

extension PersonGaleryTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.photoClickDelegate?.tappedPhoto(file_path: self.gallery?[indexPath.row].file_path ?? "")
    }
    
}


