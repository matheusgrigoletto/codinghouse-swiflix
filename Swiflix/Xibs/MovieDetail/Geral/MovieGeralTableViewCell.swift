//
//  MovieGeralTableViewCell.swift
//  Swiflix
//
//  Created by Bryan Barreto on 07/11/20.
//

import UIKit
import TMDBSwift


protocol MovieGeralTableViewCellDelegate {
    func favoritar(m: MovieDetailedMDB?)
}

class MovieGeralTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var tituloOriginal: UILabel!
    @IBOutlet weak var sinopse: UILabel!
    @IBOutlet weak var genero: UILabel!
    @IBOutlet weak var duracao: UILabel!
    @IBOutlet weak var dataLancamento: UILabel!
    
    static let cellID: String = "movieGeralTableViewCell"
    static let nibName: String = "MovieGeralTableViewCell"
    
    var delegate: MovieGeralTableViewCellDelegate?
    
    var movieDetail: MovieDetailedMDB?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(_ m: MovieDetailedMDB){
        
        self.movieDetail = m
        
        self.titulo.text = m.title
        self.tituloOriginal.text = m.original_title
        self.sinopse.text = m.overview
        if let runtime = m.runtime{
            self.duracao.text = "\(String(runtime)) minutos"
            
        }
        self.dataLancamento.text = m.release_date
        
        let generos = m.genres.map { (arg0) -> String in
            let (id, name) = arg0
            return name ?? ""
        }
        self.genero.text = generos.joined(separator: ", ")
        
    }
        func setupRuntime(_ movie: MovieDetailedMDB){
            if let runtime = movie.runtime{
                self.duracao.text = String(runtime)
                
            }
   }
    
    @IBAction func favoritarTapped(_ sender: UIButton) {
        self.delegate?.favoritar(m: self.movieDetail)
    }
    
}
