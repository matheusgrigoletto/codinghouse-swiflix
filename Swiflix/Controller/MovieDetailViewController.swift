//
//  MovieDetailViewController.swift
//  Swiflix
//
//  Created by Bryan Barreto on 07/11/20.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var backdrop: UIImageView!
    
    let fullMovie:FullMovie = MockupMovie.getFullMovie()
    
    let similarMovies = MockupMovie.getMovies()
    let reviews = MockupMovie.getReviews()
    
    var segmentedIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureDelegates()
        self.registerCells(nibName: MovieGeralTableViewCell.nibName, cellID: MovieGeralTableViewCell.cellID)
        self.registerCells(nibName: GenericMediaTableViewCell.nibName, cellID: GenericMediaTableViewCell.cellID)
        self.registerCells(nibName: MovieCriticaTableViewCell.nibName, cellID: MovieCriticaTableViewCell.cellID)
        
        self.configureUIElements()
    }
    
    func configureUIElements(){
        if let imageUrl = URL(string: "\(Utils.baseImageURL)\(self.fullMovie.backdrop)"){
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.segmentedIndex {
        case 0:
            return 1
        case 1:
            return self.similarMovies.count
        case 3:
            return self.reviews.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.segmentedIndex {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieGeralTableViewCell.cellID, for: indexPath) as? MovieGeralTableViewCell
            cell?.setup(self.fullMovie)
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: GenericMediaTableViewCell.cellID, for: indexPath) as? GenericMediaTableViewCell
            cell?.setup(withMedia: self.similarMovies[indexPath.row])
            return cell ?? UITableViewCell()
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieCriticaTableViewCell.cellID, for: indexPath) as? MovieCriticaTableViewCell
            cell?.setup(self.reviews[indexPath.row])
            return cell ?? UITableViewCell()
        default:
          return UITableViewCell()
        }
    }
    
    
}

extension MovieDetailViewController: UITableViewDelegate {
    
}
