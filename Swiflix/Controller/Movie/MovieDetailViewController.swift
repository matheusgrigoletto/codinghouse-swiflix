//
//  MovieDetailViewController.swift
//  Swiflix
//
//  Created by Bryan Barreto on 07/11/20.
//

import UIKit
import TMDBSwift

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var backdrop: UIImageView!
    
    //let fullMovie:FullMovie = MockupMovie.getFullMovie()
    var fullMovie:MovieDetailedMDB?
    var similarMovies: [SimilarMovie] = []
    var reviews: [Review] = []
    var traillers: [MovieTrailer] = []
    
    var segmentedIndex = 0
    
    var movieID:Int?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureDelegates()
        escondeTecladoClicandoFora()
        self.getFullMovie()
        self.getSimilarMovies()
        self.getReviews()
        self.getTrailers()
        
        self.registerCells(nibName: MovieGeralTableViewCell.nibName, cellID: MovieGeralTableViewCell.cellID)
        self.registerCells(nibName: GenericMediaTableViewCell.nibName, cellID: GenericMediaTableViewCell.cellID)
        self.registerCells(nibName: MovieCriticaTableViewCell.nibName, cellID: MovieCriticaTableViewCell.cellID)
        self.registerCells(nibName: MovieTraillerTableViewCell.nibName, cellID: MovieTraillerTableViewCell.cellID)
        
        self.configureUIElements()
    }
    
    private func getFullMovie(){
        MovieMDB.movie(movieID: self.movieID, language: "pt-BR") { (return, movieDetail) in
            if let movieDetail = movieDetail {
                self.fullMovie = movieDetail
                self.movieTableView.reloadData()
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
            self.rateLabel.text = "⭐️\(rate)"
        }
    }
    
    func configureDelegates(){
        self.movieTableView.delegate = self
        self.movieTableView.dataSource = self
        
        self.movieTableView.tableFooterView = UIView()
    }
    
    func registerCells(nibName: String, cellID: String){
        let nib = UINib(nibName: nibName, bundle: nil)
        self.movieTableView.register(nib, forCellReuseIdentifier: cellID)
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        self.segmentedIndex = sender.selectedSegmentIndex
        self.movieTableView.reloadData()
    }
    
}

extension MovieDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
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
                cell?.delegate = self
            }
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

extension MovieDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch self.segmentedIndex {
        case 2:
            let trailer = self.traillers[indexPath.row]
            let vc = TraillerViewController(trailer)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            break
            
        default:
            
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension MovieDetailViewController: MovieGeralTableViewCellDelegate {
    func favoritar(m: MovieDetailedMDB?) {
        
        // verificar se o filme já esta favoritado
        guard let m = m else {
            print("movie esta vazio")
            return
        }
        
        Network.shared.verificarFilmeFavorito(m: m) {
            //filme já existe
            self.showAlert(title: "Ops 😅", message: "Este filme já está favoritado")
        } ifNotExists: {
            self.showConfirmAlert(title: m.title, message: "Gostaria de favoritar este filme?", okHandler: { _ in
                self.favoritarFilme(m)
            }, cancelHandler: nil)
        } onFail: { (error) in
            self.showAlert(title: "Erro 😩", message: error)
        }
    }
    
    func favoritarFilme(_ m:MovieDetailedMDB){
        let movieJson: [String: Any] = [
            "id":m.id,
            "title":m.title,
            "vote_average":m.vote_average,
            "poster_path":m.poster_path,
            "overview":m.overview
        ]
        
        Network.shared.favoriteMovie(data: movieJson) {
            self.showAlert(title: "Sucesso", message: "Filme favoritado 😀")
        } fail: { (error) in
            self.showAlert(title: "Erro 😩", message: error)
        }

    }
}
