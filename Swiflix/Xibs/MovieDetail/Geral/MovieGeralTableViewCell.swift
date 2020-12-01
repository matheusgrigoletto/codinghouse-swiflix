//
//  MovieGeralTableViewCell.swift
//  Swiflix
//
//  Created by Bryan Barreto on 07/11/20.
//

import UIKit
import TMDBSwift

class MovieGeralTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var tituloOriginal: UILabel!
    @IBOutlet weak var sinopse: UILabel!
    @IBOutlet weak var genero: UILabel!
    @IBOutlet weak var duracao: UILabel!
    @IBOutlet weak var dataLancamento: UILabel!
    
    static let cellID: String = "movieGeralTableViewCell"
    static let nibName: String = "MovieGeralTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(_ m: MovieMDB){
        self.titulo.text = m.title
        self.tituloOriginal.text = m.original_title
        self.sinopse.text = m.overview
        self.duracao.text = "Não tem tempo"
        self.dataLancamento.text = m.release_date
        
        self.genero.text = " "
        for g in m.genres {
            if let genreName = g.name {
                self.genero.text! += "\(genreName), "
            }
        }
    
        self.genero.text?.removeLast()
        self.genero.text?.removeLast()
    }
}
