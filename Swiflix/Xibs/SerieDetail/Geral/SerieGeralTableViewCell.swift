//
//  MovieGeralTableViewCell.swift
//  Swiflix
//
//  Created by Bryan Barreto on 07/11/20.
//

import UIKit
import TMDBSwift

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
    
    func setup(_ serie: MediaDetailResponse) {
        
        self.titulo.text = serie.name
        self.tituloOriginal.text = serie.original_name
        self.sinopse.text = serie.overview
        self.duracao.text = "Não tem tempo" //TODO: Melhorar essa linha
        self.dataLancamento.text = serie.first_air_date
        self.genero.text = ""
        
        
    }
    
}
