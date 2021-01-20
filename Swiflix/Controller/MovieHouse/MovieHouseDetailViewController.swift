//
//  MovieHouseDetailViewController.swift
//  Swiflix
//
//  Created by Vanessa Montagner on 09/11/20.
//

import UIKit
import TMDBSwift

class MovieHouseDetailViewController: UIViewController {

    @IBOutlet weak var movieHouseTableView: UITableView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var backdrop: UIImageView!
    
    //let fullMovie:FullMovie = MockupMovie.getFullMovie()
    var fullMovie:MovieMDB?
    let similarMovies = MockupMovie.getMovies()
    let reviews = MockupMovie.getReviews()
    let traillers = MockupMovie.getTraillers()
    
    var segmentedIndex = 0
     
    var movieID:Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureDelegates()
        self.getFullMovie()
        
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
                self.movieHouseTableView.reloadData()
            }
        }
    }
    
    
    
    func configureUIElements(){
        if let imageUrl = URL(string: "\(Utils.baseImageURL)\(self.fullMovie?.backdrop_path)"){
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
        
    }
    
    func configureDelegates(){
        self.movieHouseTableView.delegate = self
        self.movieHouseTableView.dataSource = self
        
        self.movieHouseTableView.tableFooterView = UIView()
    }
    
    func registerCells(nibName: String, cellID: String){
        let nib = UINib(nibName: nibName, bundle: nil)
        self.movieHouseTableView.register(nib, forCellReuseIdentifier: cellID)
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        self.segmentedIndex = sender.selectedSegmentIndex
        self.movieHouseTableView.reloadData()
    }
    
}

extension MovieHouseDetailViewController: UITableViewDataSource {
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
            return cell ?? UITableViewCell()
        case 1: // filmes similares
            let cell = tableView.dequeueReusableCell(withIdentifier: GenericMediaTableViewCell.cellID, for: indexPath) as? GenericMediaTableViewCell
            cell?.setup(withMedia: self.similarMovies[indexPath.row])
            return cell ?? UITableViewCell()
        case 2: // traillers
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieTraillerTableViewCell.cellID, for: indexPath) as? MovieTraillerTableViewCell
            cell?.setup(self.traillers[indexPath.row], movieImage: self.fullMovie?.poster_path ?? "")
            return cell ?? UITableViewCell()
        case 3: // criticas
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieCriticaTableViewCell.cellID, for: indexPath) as? MovieCriticaTableViewCell
            cell?.setup(self.reviews[indexPath.row])
            return cell ?? UITableViewCell()
        default:
          return UITableViewCell()
        }
    }
    
    
}

extension MovieHouseDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
