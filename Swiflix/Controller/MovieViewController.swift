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
        self.registerCell()
        self.configureDelegates()
    }
    
    func registerCell(){
        let nib = UINib(nibName: GenericMediaTableViewCell.nibName, bundle: nil)
        self.movieTableView.register(nib, forCellReuseIdentifier: GenericMediaTableViewCell.cellID)
    }
    
    func configureDelegates(){
        self.movieTableView.delegate = self
        self.movieTableView.dataSource = self
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
    
}
