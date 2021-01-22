//
//  SerieDetailViewController.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 12/11/20.
//

import UIKit
import TMDBSwift

class SerieDetailViewController: UIViewController {
    
    @IBOutlet weak var serieTableView: UITableView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var backdrop: UIImageView!
    
    var fullSeries: MediaDetailResponse?
    var episodes: [Episode] = []
    var reviews: [Review] = []
    var similar: [Similar] = []
    
    var segmentedIndex = 0
    
    var serieID:Int?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.configureDelegates()
        self.getFullSerie()
        self.getSimilar()
        self.getReviews()
        
        self.registerCells(nibName: SerieGeralTableViewCell.nibName, cellID: SerieGeralTableViewCell.cellID)
        self.registerCells(nibName: SerieEpisodesTableViewCell.nibName, cellID: SerieEpisodesTableViewCell.cellID)
        self.registerCells(nibName: GenericMediaTableViewCell.nibName, cellID: GenericMediaTableViewCell.cellID)
        self.registerCells(nibName: MovieCriticaTableViewCell.nibName, cellID: MovieCriticaTableViewCell.cellID)
        
        self.configureUIElements()
        
        escondeTecladoClicandoFora()
        
    }
    
    private func getFullSerie(){
        
        if let id = self.serieID {
            TMDBTV.getDetails(id: id) { (response, error) in
                if let response = response {
                    self.fullSeries = response
                    self.getEpisodes()
                    DispatchQueue.main.async {
                        self.serieTableView.reloadData()
                        self.configureUIElements()
                    }
                }
            }
            
        }
        
    }
    
    private func getEpisodes() {
        
        if let id = self.serieID,
           let seasons = self.fullSeries?.number_of_seasons {
            
            for season in 1...seasons {
                
                TMDBTV.getSeason(number: season, fromSerie: id) { (response, error) in
                    if let response = response {
                        self.episodes.append(contentsOf: response.episodes ?? [])
                    }
                    if let error = error {
                        print(error)
                    }
                }
                
            }
            
        }
        
    }
    
    private func getSimilar() {
        
        if let id = self.serieID {
            TMDBTV.getSimilar(id: id) { (response, error) in
                if let response = response {
                    self.similar = response.results
                }
                if let error = error {
                    print(error)
                }
            }
        }
        
    }
    
    private func getReviews() {
        
        if let id = self.serieID {
            #warning("Mostrando reviews em inglês porque alguns filmes não tem review em português")
            TMDBTV.getReviews(id: id, language: "en-US") { (response, error) in
                if let response = response {
                    self.reviews = response.results
                }
            }
        }
        
    }
    
    func configureUIElements(){
        
        self.serieTableView.sectionHeaderHeight = 30
        
        if let imageUrl = URL(string: "\(Utils.baseImageURL)\(self.fullSeries?.backdrop_path ?? "")") {
            
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
        
        if let vote = self.fullSeries?.vote_average {
            self.rateLabel.text = "\(Utils.star)\(vote)"
        } else {
            self.rateLabel.text = ""
        }
    }
    
    func configureDelegates() {
        
        self.serieTableView.delegate = self
        self.serieTableView.dataSource = self
        self.serieTableView.tableFooterView = UIView()
        
    }
    
    func registerCells(nibName: String, cellID: String) {
        
        let nib = UINib(nibName: nibName, bundle: nil)
        self.serieTableView.register(nib, forCellReuseIdentifier: cellID)
        
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
            if let serie = self.fullSeries {
                cell?.setup(serie)
            }
            return cell ?? UITableViewCell()
            
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: SerieEpisodesTableViewCell.cellID, for: indexPath) as? SerieEpisodesTableViewCell
            if let episode = self.episodes.filter( { $0.season == indexPath.section + 1 && $0.episode == indexPath.row + 1 } ).first {
                cell?.setup(episodio: episode.asSerieEpisode)
            }
            return cell ?? UITableViewCell()
            
        case 2:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: GenericMediaTableViewCell.cellID, for: indexPath) as? GenericMediaTableViewCell
            cell?.setup(withMedia: self.similar[indexPath.row].asGenericMedia)
            return cell ?? UITableViewCell()
            
        case 3:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieCriticaTableViewCell.cellID, for: indexPath) as? MovieCriticaTableViewCell
            cell?.setup(self.reviews[indexPath.row].asReviews)
            return cell ?? UITableViewCell()
            
        default:
            
            return UITableViewCell()
            
        }
        
    }
    
}
