//
//  SerieEpisodesTableViewCell.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 12/11/20.
//

import UIKit

class SerieEpisodesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    static let nibName: String = "SerieEpisodesTableViewCell"
    static let cellID: String = "SerieEpisodesTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(episodio: SerieEpisode) {
        
        self.episodeNumber.text = "Episódio \(episodio.episode)"
        self.episodeTitle.text = episodio.title
        self.releaseDate.text = episodio.releaseDate
        self.overview.text = episodio.overview
        
        if let imageURL = URL(string: "\(Utils.baseImageURL)\(episodio.backdrop)"){
            
            do{
                
                let imageData = try Data(contentsOf: imageURL)
                self.thumbnail.image = UIImage(data: imageData)
                
            }catch{
                
                print("Error on line \(#line) of \(#file)")
                
            }
        }
        
    }
    
}
