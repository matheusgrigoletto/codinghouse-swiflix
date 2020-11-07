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
    
    let fullMovie:[FullMovie] = [FullMovie(backdrop: "/9DeGfFIqjph5CBFVQrD6wv9S7rR.jpg", genres: [Genres(id: 12, name: "Aventura"), Genres(id: 14, name: "Fantasia"), Genres(id: 28, name: "Ação")], homePage: "http://www.lordoftherings.net", id: 122, originalTitle: "The Lord of the Rings: The Return of the King", overview: "O confronto final entre as forças do bem e do mal que lutam pelo controle do futuro da Terra Média se aproxima. Sauron planeja um grande ataque a Minas Tirith, capital de Gondor, o que faz com que Gandalf e Pippin partam para o local na intenção de ajudar a resistência. Um exército é reunido por Theoden em Rohan, em mais uma tentativa de deter as forças de Sauron. Enquanto isso, Frodo, Sam e Gollum seguem sua viagem rumo à Montanha da Perdição para destruir o anel.", poster: "/izPNMzffsgZUvlbiYlPxjFr3TAa.jpg", releaseDate: "2003-12-01", runtime: 201, title: "O Senhor dos Anéis: O Retorno do Rei", vote: 8.5)]
    
    var segmentedIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureDelegates()
        self.registerCells(nibName: MovieGeralTableViewCell.nibName, cellID: MovieGeralTableViewCell.cellID)
        
        self.configureUIElements()
    }
    
    func configureUIElements(){
        if let imageUrl = URL(string: "\(Utils.baseImageURL)\(self.fullMovie[0].backdrop)"){
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
        case 0, 3:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.segmentedIndex {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieGeralTableViewCell.cellID, for: indexPath) as? MovieGeralTableViewCell
            cell?.setup(self.fullMovie[indexPath.row])
            return cell ?? UITableViewCell()
        default:
          return UITableViewCell()
        }
    }
    
    
}

extension MovieDetailViewController: UITableViewDelegate {
    
}
