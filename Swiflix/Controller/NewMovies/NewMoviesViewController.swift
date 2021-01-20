//
//  NewMoviesViewController.swift
//  Swiflix
//
//  Created by Vanessa Montagner on 26/10/20.
//

import UIKit
import TMDBSwift

class NewMoviesViewController: UIViewController {

    @IBOutlet weak var newMoviesTableView: UITableView!
    
    var movies:[GenericMedia] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.registerCell(nib: GenericMediaTableViewCell.nibName, cellID: GenericMediaTableViewCell.cellID)
        self.configureDelegates()
        self.getNewMovies()
        
    }
    
    private func getNewMovies(){
        
        
        MovieMDB.upcoming(page: 1, language: "pt-BR") { (return, movies) in
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
                self.newMoviesTableView.reloadData()
            }
        }
        
    }
    

    func registerCell(nib:String, cellID: String){
        let nib = UINib(nibName: nib, bundle: nil)
        self.newMoviesTableView.register(nib, forCellReuseIdentifier: cellID)
    }
    
    func configureDelegates(){
        self.newMoviesTableView.delegate = self
        self.newMoviesTableView.dataSource = self
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            #warning("passar o id do filme escolhido para a proxima tela")
            let movie = sender as? GenericMedia
            let vc = segue.destination as? NewMoviesDetailViewController
            vc?.title = movie?.title ?? "Erro"
            vc?.movieID = movie?.id
            
        }
}

    extension NewMoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GenericMediaTableViewCell.cellID, for: indexPath) as? GenericMediaTableViewCell
        cell?.setup(withMedia: self.movies[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    
}

extension NewMoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        #warning("performar segue enviando o id do filme escolhido")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let chosenMovie = self.movies[indexPath.row]
        performSegue(withIdentifier: Segues.toNewMovieDetail, sender: chosenMovie)
    }
}
    


