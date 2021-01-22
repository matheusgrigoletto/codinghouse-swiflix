//
//  NewMoviesDetailViewController.swift
//  Swiflix
//
//  Created by Vanessa Montagner on 12/11/20.
//

import UIKit
import TMDBSwift

class NewMoviesDetailViewController: UIViewController {

    @IBOutlet weak var newMoviesTableView: UITableView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var backdrop: UIImageView!
    
    var fullMovie: MovieMDB?
    var similarMovies: [SimilarMovie] = []
    var reviews: [Review] = []
    var traillers: [MovieTrailer] = []
    
    var segmentedIndex = 0
    
    var movieID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureDelegates()
        self.getFullMovies()
        self.getSimilarMovies()
        self.getReviews()
        self.getTrailers()
        
        self.registerCells(nibName: MovieGeralTableViewCell.nibName, cellID: MovieGeralTableViewCell.cellID)
        self.registerCells(nibName: GenericMediaTableViewCell.nibName, cellID: GenericMediaTableViewCell.cellID)
        self.registerCells(nibName: MovieCriticaTableViewCell.nibName, cellID: MovieCriticaTableViewCell.cellID)
        self.registerCells(nibName: MovieTraillerTableViewCell.nibName, cellID: MovieTraillerTableViewCell.cellID)
        escondeTecladoClicandoFora()
        self.configureUIElements()
    }
    
    
    private func getFullMovies(){
        MovieMDB.movie(movieID: self.movieID, language: "pt-BR") { (return, movieDetail) in
            if let movieDetail = movieDetail {
                self.fullMovie = movieDetail
                self.newMoviesTableView.reloadData()
                self.configureUIElements()
            }
        }
    }
    
    private func getSimilarMovies() {
        if let id = self.movieID {
            TMDBMovies.getSimilar(id: id) { (response, error) in
                if let response = response {
                    self.similarMovies = response.results
                }
            }
        }
    }
    
    private func getReviews() {
        if let id = self.movieID {
            #warning("Mostrando reviews em inglês porque alguns filmes não tem review em português")
            TMDBMovies.getReviews(id: id, language: "en-US") { (response, error) in
                if let response = response {
                    self.reviews = response.results
                }
            }
        }
    }
    
    private func getTrailers() {
        if let id = self.movieID {
            TMDBMovies.getTrailers(id: id) { (response, error) in
                if let response = response {
                    self.traillers = response.results
                }
            }
        }
    }
    
    func configureUIElements(){
        if let imageUrl = URL(string: "\(Utils.baseImageURL)\(self.fullMovie?.backdrop_path ?? "")"){
            do{
                let imageData = try Data(contentsOf: imageUrl)
                self.backdrop.image = UIImage(data: imageData)
            }catch{
                print(error.localizedDescription)
                self.backdrop.image = UIImage(systemName: "film")
            }
        }else{
            self.backdrop.image = UIImage(systemName: "film")
        }
        
        if let rate = self.fullMovie?.vote_average {
            self.rateLabel.text = "\(Utils.star)\(rate)"
        }
        
    }
    
    func configureDelegates(){
        self.newMoviesTableView.delegate = self
        self.newMoviesTableView.dataSource = self
        
        self.newMoviesTableView.tableFooterView = UIView()
    }
    
    func registerCells(nibName: String, cellID: String){
        let nib = UINib(nibName: nibName, bundle: nil)
        self.newMoviesTableView.register(nib, forCellReuseIdentifier: cellID)
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        self.segmentedIndex = sender.selectedSegmentIndex
        self.newMoviesTableView.reloadData()
    }
    
}

extension NewMoviesDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.segmentedIndex {
        case 0:
            tableView.allowsSelection = false
            return 1
        case 1:
            tableView.allowsSelection = true
            return self.similarMovies.count
        case 2:
            tableView.allowsSelection = true
            return self.traillers.count
        case 3:
            tableView.allowsSelection = false
            return self.reviews.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.segmentedIndex {
        case 0: //geral
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieGeralTableViewCell.cellID, for: indexPath) as? MovieGeralTableViewCell
            if let fullMovie = self.fullMovie {
                cell?.setup(fullMovie)
            }
        //    cell?.setup(self.fullMovie)
            return cell ?? UITableViewCell()
        case 1: // filmes similares
            let cell = tableView.dequeueReusableCell(withIdentifier: GenericMediaTableViewCell.cellID, for: indexPath) as? GenericMediaTableViewCell
            cell?.setup(withMedia: self.similarMovies[indexPath.row].genericMedia)
            return cell ?? UITableViewCell()
        case 2: // traillers
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieTraillerTableViewCell.cellID, for: indexPath) as? MovieTraillerTableViewCell
            cell?.setup(self.traillers[indexPath.row].asMovieTrailler, movieImage: self.fullMovie?.poster_path ?? "")
            return cell ?? UITableViewCell()
        case 3: // criticas
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieCriticaTableViewCell.cellID, for: indexPath) as? MovieCriticaTableViewCell
            cell?.setup(self.reviews[indexPath.row].asReviews)
            return cell ?? UITableViewCell()
        default:
          return UITableViewCell()
        }
    }
    
    
}

extension NewMoviesDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
