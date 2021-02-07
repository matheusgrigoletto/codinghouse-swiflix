//
//  MovieHouseViewController.swift
//  Swiflix
//
//  Created by Vanessa Montagner on 26/10/20.
//

import UIKit
import TMDBSwift

class MovieHouseViewController: UIViewController {

    @IBOutlet weak var movieHouseTableView: UITableView!
   
    
    var movies:[GenericMedia] = []
    var page: Int = 1

    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        self.registerCell(nib: GenericMediaTableViewCell.nibName, cellID: GenericMediaTableViewCell.cellID)
        self.configureDelegates()
        self.getMovieHouse(page: self.page)
        
    }
    
    
    private func getMovieHouse(page: Int){
        
        TMDBMovies.getNowPlaying(language: "pt-BR", page: page, region: "BR") { (movies, erro) in
            
            if let movies = movies?.results {
                for movie in movies {
                    if
                        let title = movie.title,
                        let poster = movie.poster_path{
                        
                        let generic = GenericMedia(id: movie.id, title: title, rating: movie.vote_average, overview: movie.overview, poster: poster)
                        self.movies.append(generic)
                    }
                }
                self.page += 1
                DispatchQueue.main.async {
                    self.movieHouseTableView.reloadData()
                }
            }
            
        }
        
    }
    
    func registerCell(nib:String, cellID: String){
        let nib = UINib(nibName: nib, bundle: nil)
        self.movieHouseTableView.register(nib, forCellReuseIdentifier: cellID)
    }
    
    func configureDelegates(){
        self.movieHouseTableView.delegate = self
        self.movieHouseTableView.dataSource = self
        
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            #warning("passar o id do filme escolhido para a proxima tela")
            let movie = sender as? GenericMedia
            let vc = segue.destination as? MovieHouseDetailViewController
            vc?.title = movie?.title ?? "Erro"
            vc?.movieID = movie?.id
        }
}

    extension MovieHouseViewController: UITableViewDataSource {
        
        
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if self.movies.count - 1 == indexPath.row {
            self.getMovieHouse(page: self.page)
        }

        
        let cell = tableView.dequeueReusableCell(withIdentifier: GenericMediaTableViewCell.cellID, for: indexPath) as? GenericMediaTableViewCell
        cell?.setup(withMedia: self.movies[indexPath.row])
        return cell ?? UITableViewCell()
    }
         
    
    
}

extension MovieHouseViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        #warning("performar segue enviando o id do filme escolhido")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let chosenMovie = self.movies[indexPath.row]
        performSegue(withIdentifier: Segues.toMovieHouseDetail, sender: chosenMovie)
    }
}

