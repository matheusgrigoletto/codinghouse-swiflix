//
//  MovieGeralTableViewCell.swift
//  Swiflix
//
//  Created by Bryan Barreto on 07/11/20.
//

import UIKit

class SerieGeralTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var tituloOriginal: UILabel!
    @IBOutlet weak var sinopse: UILabel!
    @IBOutlet weak var genero: UILabel!
    @IBOutlet weak var duracao: UILabel!
    @IBOutlet weak var dataLancamento: UILabel!
    
    static let cellID: String = "SerieGeralTableViewCell"
    static let nibName: String = "SerieGeralTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(_ m: Serie){
        self.titulo.text = m.title
        self.tituloOriginal.text = m.originalTitle
        self.sinopse.text = m.overview
        self.duracao.text = "\(m.runtime) min"
        self.dataLancamento.text = m.releaseDate
        
        self.genero.text = ""
        for g in m.genres {
            self.genero.text! += "\(g.name), "
        }

        if self.genero.text != "" {
            self.genero.text?.removeLast(2)
        }
    
    }
}
