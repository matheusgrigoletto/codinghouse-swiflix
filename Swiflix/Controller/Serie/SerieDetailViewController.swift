//
//  SerieDetailViewController.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 12/11/20.
//

import UIKit

class SerieDetailViewController: UIViewController {
    
    @IBOutlet weak var serieTableView: UITableView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var backdrop: UIImageView!
    
//    var serie: Serie?
    var serie: TVDetailResponse?
    let episodes: [SerieEpisode] = MockupSerie.getEpiosdes()
    let reviews: [Reviews] = MockupSerie.getReviews()
    let similar: [GenericMedia] = MockupSerie.getSeries()
    
    var segmentedIndex = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.configureDelegates()
        
        self.registerCells(nibName: SerieGeralTableViewCell.nibName, cellID: SerieGeralTableViewCell.cellID)
        self.registerCells(nibName: SerieEpisodesTableViewCell.nibName, cellID: SerieEpisodesTableViewCell.cellID)
        self.registerCells(nibName: GenericMediaTableViewCell.nibName, cellID: GenericMediaTableViewCell.cellID)
        self.registerCells(nibName: MovieCriticaTableViewCell.nibName, cellID: MovieCriticaTableViewCell.cellID)
        
        self.configureUIElements()
        
    }
    
    func configureDelegates() {
        
        self.serieTableView.delegate = self
        self.serieTableView.dataSource = self
        
    }
    
    func registerCells(nibName: String, cellID: String) {
        
        let nib = UINib(nibName: nibName, bundle: nil)
        self.serieTableView.register(nib, forCellReuseIdentifier: cellID)
        
    }
    
    func setupCell(with serie: TVDetailResponse) {
        
        self.serie = serie
        self.title = self.serie?.name ?? "Erro"
        
    }
    
    func configureUIElements() {
        
        self.serieTableView.sectionHeaderHeight = 30
        
        if let imageUrl = URL(string: "\(Utils.baseImageURL)\(self.serie?.backdrop_path ?? "")") {
            
            do {
                
                let imageData = try Data(contentsOf: imageUrl)
                self.backdrop.image = UIImage(data: imageData)
                
            } catch {
                
                print(error.localizedDescription)
                self.backdrop.image = UIImage(systemName: "film")
                
            }
            
        } else {
            
            self.backdrop.image = UIImage(systemName: "film")
            
        }
        
        if let vote = self.serie?.vote_average {
            self.rateLabel.text = "\(Utils.star)\(vote)"
        } else {
            self.rateLabel.text = ""
        }
        
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        
        self.segmentedIndex = sender.selectedSegmentIndex
        self.serieTableView.reloadData()
        
    }
    
}

extension SerieDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}

extension SerieDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        switch self.segmentedIndex {
        
        // Aba episódios
        case 1:
            var set = Set(self.episodes.compactMap( { $0.season } ))
            return set.count
            
        default:
            return 1
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch self.segmentedIndex {
        
        // Aba episódios
        case 1:
            return "Temporada \(section + 1)"
            
        default:
            return nil
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch self.segmentedIndex {
        
        case 0:
            
            self.setTableViewProperties(tableView, allowSelection: false, allowScroll: true)
            return 1
            
        case 1:
            
            self.setTableViewProperties(tableView, allowSelection: false, allowScroll: true)
            return self.episodes.filter( { $0.season == section + 1}).count
            
        case 2:
            
            self.setTableViewProperties(tableView, allowSelection: true, allowScroll: true)
            return self.similar.count
            
        case 3:
            
            self.setTableViewProperties(tableView, allowSelection: false, allowScroll: true)
            return self.reviews.count
            
        default:
            return 0
            
        }
        
    }
    
    func setTableViewProperties(_ tableView: UITableView, allowSelection: Bool, allowScroll: Bool) {
        
        tableView.allowsSelection = allowSelection
        tableView.isScrollEnabled = allowScroll
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch self.segmentedIndex {
        
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: SerieGeralTableViewCell.cellID, for: indexPath) as? SerieGeralTableViewCell
            if let serie = self.serie {
                cell?.setup(serie)
            }
            return cell ?? UITableViewCell()
            
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: SerieEpisodesTableViewCell.cellID, for: indexPath) as? SerieEpisodesTableViewCell
            if let episode = self.episodes.filter( { $0.season == indexPath.section + 1 && $0.episode == indexPath.row + 1 } ).first {
                cell?.setup(episodio: episode)
            }
            return cell ?? UITableViewCell()
            
        case 2:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: GenericMediaTableViewCell.cellID, for: indexPath) as? GenericMediaTableViewCell
            cell?.setup(withMedia: self.similar[indexPath.row])
            return cell ?? UITableViewCell()
            
        case 3:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieCriticaTableViewCell.cellID, for: indexPath) as? MovieCriticaTableViewCell
            cell?.setup(self.reviews[indexPath.row])
            return cell ?? UITableViewCell()
            
        default:
            
            return UITableViewCell()
            
        }
        
        //        case 2: // traillers
        //            let cell = tableView.dequeueReusableCell(withIdentifier: MovieTraillerTableViewCell.cellID, for: indexPath) as? MovieTraillerTableViewCell
        //            cell?.setup(self.traillers[indexPath.row], movieImage: self.fullMovie.poster)
        //            return cell ?? UITableViewCell()
        
        
    }
    
}
