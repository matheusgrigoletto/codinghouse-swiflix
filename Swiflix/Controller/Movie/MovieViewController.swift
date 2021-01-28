//
//  MovieViewController.swift
//  Swiflix
//
//  Created by Bryan Barreto on 24/10/20.
//

import UIKit
import TMDBSwift
import IQKeyboardManagerSwift

class MovieViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movies:[GenericMedia] = []
    var page: Int = 1
   
    
    override func viewDidLoad() {
        searchBar.placeholder = "Procure por um filme"
        
        super.viewDidLoad()
        self.registerCell(nib: GenericMediaTableViewCell.nibName, cellID: GenericMediaTableViewCell.cellID)
        self.configureDelegates()
        self.movieTableView.keyboardDismissMode = .onDrag
        
      
        
        self.getMovies(page: self.page)
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard UIApplication.shared.applicationState == .inactive else { return }
        
        
    }
    
    
    private func getSearchMovies(searchText: String){
        
        self.movies = []
        
        SearchMDB.movie(query: searchText, language: "pt-BR", page: 1, includeAdult: false, year: nil, primaryReleaseYear: nil) { (return, movies) in
            
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
    
    
    private func getMovies(page: Int){
        

    
        
        MovieMDB.popular(language: "pt-BR", page: page) { (result, movies) in
            if let movies = movies {
                for movie in movies {
                    if
                        let title = movie.title,
                        let id = movie.id,
                        let rating = movie.vote_average,
                        let overview = movie.overview,
                        let poster = movie.poster_path {
                        
                        let generic = GenericMedia(id: id, title: title, rating: rating, overview: overview, poster: poster)
                        self.movies.append(generic)
                    }
                }
                self.page += 1
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
        self.searchBar.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let movie = sender as? GenericMedia
        let vc = segue.destination as? MovieDetailViewController
        vc?.title = movie?.title ?? "Erro"
        vc?.movieID = movie?.id
    }
}

extension MovieViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.movies.count - 1 == indexPath.row {
            self.getMovies(page: self.page)
        }
        
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

extension MovieViewController: UISearchBarDelegate{
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        searchBar.resignFirstResponder()
        
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
     

    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
       
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if (!searchText.isEmpty){
            getSearchMovies(searchText: searchText)
        }else{
            self.movies = []
            self.page = 1
            getMovies(page: self.page)
        }
        
    }
    
}


