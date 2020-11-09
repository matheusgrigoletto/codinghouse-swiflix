//
//  MovieViewController.swift
//  Swiflix
//
//  Created by Bryan Barreto on 24/10/20.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    
    let movies:[GenericMedia] = MockupMovie.getMovies()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell(nib: GenericMediaTableViewCell.nibName, cellID: GenericMediaTableViewCell.cellID)
        self.configureDelegates()
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
        #warning("passar o id do filme escolhido para a proxima tela")
        let movie = sender as? GenericMedia
        let vc = segue.destination as? MovieDetailViewController
        vc?.title = movie?.title ?? "Erro"
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
        #warning("performar segue enviando o id do filme escolhido")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let chosenMovie = self.movies[indexPath.row]
        performSegue(withIdentifier: Segues.toMovieDetail, sender: chosenMovie)
    }
}
