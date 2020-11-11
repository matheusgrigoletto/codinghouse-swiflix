//
//  MovieCriticaTableViewCell.swift
//  Swiflix
//
//  Created by Bryan Barreto on 08/11/20.
//
import UIKit

class MovieCriticaTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var review: UILabel!
    
    static let nibName: String = "MovieCriticaTableViewCell"
    static let cellID: String = "movieCriticaCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(_ r: Reviews){
        self.author.text = r.author
        self.review.text = r.content
    }
    
}
