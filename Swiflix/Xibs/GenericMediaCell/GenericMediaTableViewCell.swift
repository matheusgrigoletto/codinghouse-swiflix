//
//  GenericMediaTableViewCell.swift
//  Swiflix
//
//  Created by Bryan Barreto on 27/10/20.
//

import UIKit

class GenericMediaTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var outerView: UIView!
    
    @IBOutlet weak var contentViewColor: UIView!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    
    static let nibName: String = "GenericMediaTableViewCell"
    static let cellID: String = "GenericMediaCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
        
            self.contentView.layer.cornerRadius = 6
            self.poster.applyShadowWithCorner(containerView: outerView, cornerRadious: 6, color: UIColor.gray.cgColor)
        
    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(withMedia media: GenericMedia){
        self.title.text = media.title
        self.rating.text = "\(Utils.star)\(media.rating)"
        self.overview.text = media.overview
        
        self.poster.withMediaURL(media.poster)
    }
    
    func setup(withSerie serie: GenericPopularMedia) {
        
        self.title.text = serie.title
        self.rating.text = "\(Utils.star)\(serie.rating ?? 0)"
        self.overview.text = serie.overview
        
        self.poster.withMediaURL(serie.poster)
        
    }
    
}
