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
        self.duracao.text = ""
        if let runtime = serie.episode_run_time{
        for ep in runtime {
                self.duracao.text! = "\(ep) "
            }
        }
        self.duracao.text! += "minutos"

       
        self.dataLancamento.text = serie.first_air_date
        self.genero.text! = ""
        for g in serie.genres {
            self.genero.text! += "\(g.name), "
            
        }
    
        self.genero.text?.removeLast()
        self.genero.text?.removeLast()
        
        
    }
    
}
