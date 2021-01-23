//
//  SerieViewController.swift
//  Swiflix
//
//  Created by Bryan Barreto on 25/10/20.
//

import UIKit
import TMDBSwift

class SerieViewController: UIViewController {
    
    @IBOutlet weak var serieTableView: UITableView!
    
    var series: [GenericPopularMedia] = []
    var page: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureDelegates()
        self.registerCell()
        
        self.getPopularSeries(page: self.page)
        
        escondeTecladoClicandoFora()
    }
    
    func configureDelegates() {
        self.serieTableView.delegate = self
        self.serieTableView.dataSource = self
    }
    
    func registerCell() {
        let nib = UINib(nibName: GenericMediaTableViewCell.nibName, bundle: nil)
        self.serieTableView.register(nib, forCellReuseIdentifier: GenericMediaTableViewCell.cellID)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        #warning("passar o id da serie escolhida para a proxima tela")
                if let serie = sender as? GenericPopularMedia {
                    let vc = segue.destination as? SerieDetailViewController
                    vc?.title = serie.title ?? "Erro"
                    vc?.serieID = serie.id
                    
                }
    }
    
    
    private func getPopularSeries(page: Int) {
        
        TVMDB.popular(page: page, language: "pt-BR") { (return, populares) in
            
            if let populares = populares {
                for popular in populares {
                    if
                        let title = popular.name,
                        let id = popular.id,
                        let rating = popular.vote_average,
                        let overview = popular.overview,
                        let poster = popular.poster_path{
                        
                        let generic = GenericPopularMedia(id: id, title: title, rating: rating, overview: overview, poster: poster)
                        self.series.append(generic)
                    }
                }
                self.page += 1
                self.serieTableView.reloadData()
            }
            
        }
        
    }
    
}

extension SerieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.series.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.series.count - 1 == indexPath.row {
            self.getPopularSeries(page: self.page)
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GenericMediaTableViewCell.cellID, for: indexPath) as? GenericMediaTableViewCell
        cell?.setup(withSerie: self.series[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    
}

extension SerieViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        #warning("performar segue enviando o id da serie escolhida")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let chosenSerie = self.series[indexPath.row]
        performSegue(withIdentifier: Segues.toSerieDetail, sender: chosenSerie)
    }
    
}
