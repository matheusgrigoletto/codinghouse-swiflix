//
//  MovieViewController.swift
//  Swiflix
//
//  Created by Bryan Barreto on 24/10/20.
//

import UIKit
import TMDBSwift

class MovieViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    
    var movies:[GenericMedia] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell(nib: GenericMediaTableViewCell.nibName, cellID: GenericMediaTableViewCell.cellID)
        self.configureDelegates()
        
        self.getMovies()
    }
    
    private func getMovies(){
        
        MovieMDB.popular(language: "pt-BR", page: 1) { (return, movies) in
            if let movies = movies {
                for movie in movies {
                    if
                        let title = movie.title,
                        let id = movie.id,
                        let rating = movie.vote_average,
                        let overview = movie.overview,
                        let poster = movie.poster_path{
                        
                        let generic = GenericMedia(id: id, title: title, rating: rating, overview: overview, poster: poster)
                        self.movies.append(generic)
                    }
                }
                self.movieTableView.reloadData()
            }
        }
    }
    
    func registerCell(nib:String, cellID: String){
        let nib = UINib(nibName: nib, bundle: nil)
        self.movieTableView.register(nib, forCellReuseIdentifier: cellID)
    }
    
    func configureDelegates(){
        self.movieTableView.delegate = self
        self.movieTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let movie = sender as? GenericMedia
        let vc = segue.destination as? MovieDetailViewController
        vc?.title = movie?.title ?? "Erro"
        vc?.movieID = movie?.id
    }
}

extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GenericMediaTableViewCell.cellID, for: indexPath) as? GenericMediaTableViewCell
        cell?.setup(withMedia: self.movies[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    
}

extension MovieViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let chosenMovie = self.movies[indexPath.row]
        performSegue(withIdentifier: Segues.toMovieDetail, sender: chosenMovie)
    }
}
