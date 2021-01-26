//
//  PerfilViewController.swift
//  Swiflix
//
//  Created by Bryan Barreto on 17/11/20.
//

import UIKit
import Firebase



class PerfilViewController: UIViewController {
    
    @IBOutlet weak var favoriteTableView: UITableView!
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mudarSenhaBtn: UIButton!
    
    var segmentedIndex:Int = 0
    var favoriteMovies = MockupMovie.getMovies()
    var favoriteSeries = MockupSerie.getSeries()
    
    override func viewDidLoad() {
        getAuthInfo()
        
        super.viewDidLoad()
        escondeTecladoClicandoFora()
        self.configureUI()
        self.configureTableView()
        
        
        
    }
    
    func configureTableView(){
        self.favoriteTableView.delegate = self
        self.favoriteTableView.dataSource = self
        self.favoriteTableView.allowsSelection = false
        self.favoriteTableView.tableFooterView = UIView()
        
        let nib = UINib(nibName: GenericMediaTableViewCell.nibName, bundle: nil)
        self.favoriteTableView.register(nib, forCellReuseIdentifier: GenericMediaTableViewCell.cellID)
    }

    
    func configureUI(){
        self.title = "Perfil"
        mudarSenhaBtn.layer.cornerRadius = mudarSenhaBtn.layer.frame.height / 2
        try! Auth.auth().signOut()
        let logoutButton = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logout))
        self.navigationItem.rightBarButtonItem = logoutButton
    }
    
    func getAuthInfo(){
        let nome = Auth.auth().currentUser?.displayName
        let email = Auth.auth().currentUser?.email
        nomeLabel.text = nome
        emailLabel.text = email
    }

    
    
    @objc func logout(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateInitialViewController()
                self.view.window?.rootViewController = vc
        print("logging out...")
    }

    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        self.segmentedIndex = sender.selectedSegmentIndex
        self.favoriteTableView.reloadData()
    }
}

extension PerfilViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount = self.segmentedIndex == 0 ? self.favoriteMovies.count : self.favoriteSeries.count
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GenericMediaTableViewCell.cellID, for: indexPath) as? GenericMediaTableViewCell
        let media = self.segmentedIndex == 0 ? self.favoriteMovies[indexPath.row] : self.favoriteSeries[indexPath.row]
        cell?.setup(withMedia: media)
        return cell ?? UITableViewCell()
    }
    
}

extension PerfilViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if self.segmentedIndex == 0 {
            self.favoriteMovies.remove(at: indexPath.row)
        }else{
            self.favoriteSeries.remove(at: indexPath.row)
        }
        
        tableView.deleteRows(at: [indexPath], with: .fade)
        
    }
}


