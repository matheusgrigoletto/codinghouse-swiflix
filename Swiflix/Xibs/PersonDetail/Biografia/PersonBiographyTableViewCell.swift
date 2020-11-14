//
//  MovieCriticaTableViewCell.swift
//  Swiflix
//
//  Created by Bryan Barreto on 08/11/20.
//

import UIKit

class PersonBiographyTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var Biography: UILabel!
    
    static let nibName: String = "PersonBiographyTableViewCell"
    static let cellID: String = "personBiographyCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(_ r: FullPerson){
        self.name.text = r.name
        self.Biography.text = r.biography
    }
    
}
