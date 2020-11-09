//
//  MovieHouseViewController.swift
//  Swiflix
//
//  Created by Vanessa Montagner on 26/10/20.
//

import UIKit

class MovieHouseViewController: UIViewController {

    @IBOutlet weak var movieHouseTableView: UITableView!
    
    let movies:[GenericMedia] = MockupMovie.getMovies()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell(nib: GenericMediaTableViewCell.nibName, cellID: GenericMediaTableViewCell.cellID)
        self.configureDelegates()
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
        }
}

    extension MovieHouseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    

