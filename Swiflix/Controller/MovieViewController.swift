//
//  MovieViewController.swift
//  Swiflix
//
//  Created by Bryan Barreto on 24/10/20.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.configureDelegates()
    }
    
    func registerCell(){
        
    }
    
    func configureDelegates(){
        self.movieTableView.delegate = self
        self.movieTableView.dataSource = self
    }
}

extension MovieViewController: UITableViewDataSource {
    
}

extension MovieViewController: UITableViewDelegate {
    
}
