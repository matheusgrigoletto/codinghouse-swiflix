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
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movies:[GenericMedia] = []
    var page: Int = 1
    let date = Date()
    let calendar = Calendar.current
    
    
    

    
    override func viewDidLoad() {
        searchBar.placeholder = "Procure por um filme"
        
        super.viewDidLoad()
        self.registerCell(nib: GenericMediaTableViewCell.nibName, cellID: GenericMediaTableViewCell.cellID)
        self.configureDelegates()
        self.getMovieHouse(page: self.page)
        self.movieHouseTableView.keyboardDismissMode = .onDrag
    }
    
    
    
    private func getSearchMovieHouse(searchText: String){
        self.movies = []
        let ano = calendar.component(.year, from: date)
        
        
        SearchMDB.movie(query: searchText, language: "pt-BR", page: 1, includeAdult: false, year: ano, primaryReleaseYear: ano) { (return, movies) in
            
            
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
                print()
                self.movieHouseTableView.reloadData()
                
            }
        }
        
    }
    
    private func getMovieHouse(page: Int){
        
        MovieMDB.nowplaying(language: "pt-BR", page: page) { (return, movies) in
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
                self.page += 1
                self.movieHouseTableView.reloadData()
                print("============= print get moviesHouse")
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
        self.searchBar.delegate = self
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


extension MovieHouseViewController: UISearchBarDelegate{
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        searchBar.resignFirstResponder()
        
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
     

    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
       
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if (!searchText.isEmpty){
            getSearchMovieHouse(searchText: searchText)
        }else{
            self.movies = []
            self.page = 1
            getMovieHouse(page: self.page)
        }
        
    }
    
}
    

