//
//  SerieTableViewCell.swift
//  Swiflix
//
//  Created by Bryan Barreto on 25/10/20.
//

import UIKit

class MovieSerieTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var outerView: UIView!
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var sinopse: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    let cellID: String = ""
    let nibName: String = "MovieSerieTableViewCell"
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
        
       
        self.contentView.layer.cornerRadius = 6
        self.posterImage.applyShadowWithCorner(containerView: outerView, cornerRadious: 6)
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(_ data: SimpleMovieSerie){
        self.title.text = data.title
        self.sinopse.text = data.sinopse
        self.rating.text = "\(Utils.star)\(data.rating)"
        
        if let imageURL = URL(string: "\(Utils.baseImageURL)\(data.image)") {
            do {
                let imageData = try Data(contentsOf: imageURL)
                self.posterImage.image = UIImage(data: imageData)
            }catch {
                fatalError("error getting image data from url")
            }
        }else{
            self.posterImage.image = UIImage(systemName: "film")
        }
        
    }
    
}

