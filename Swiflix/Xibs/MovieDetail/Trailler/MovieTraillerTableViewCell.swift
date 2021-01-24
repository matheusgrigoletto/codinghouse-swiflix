//
//  MovieTraillerTableViewCell.swift
//  Swiflix
//
//  Created by Bryan Barreto on 08/11/20.
//

import UIKit

class MovieTraillerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var site: UILabel!
    @IBOutlet weak var tipo: UILabel!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var poster: UIImageView!
    
    
    static let nibName: String = "MovieTraillerTableViewCell"
    static let cellID: String = "traillerCellID"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(_ t: MovieTrailler, movieImage: String){
        self.site.text = t.site
        self.nome.text = t.name
        self.tipo.text = t.type
        
        self.poster.withMediaURL(movieImage)
    }
    
}
