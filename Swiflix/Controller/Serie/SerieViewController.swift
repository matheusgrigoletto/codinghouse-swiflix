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
    @IBOutlet weak var searchBar: UISearchBar!
    
    var series: [GenericPopularMedia] = []
    var page: Int = 1
    
    override func viewDidLoad() {
        
        searchBar.placeholder = "Procure por uma série"
        
        super.viewDidLoad()
        self.configureDelegates()
        self.registerCell()
        self.serieTableView.keyboardDismissMode = .onDrag
        self.getPopularSeries(page: self.page)
        
    }
    
    func configureDelegates() {
        self.serieTableView.delegate = self
        self.serieTableView.dataSource = self
        self.searchBar.delegate = self
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
    
    
    private func getSearchSeries(searchText: String){
        
        self.series = []
        
        
        SearchMDB.tv(query: searchText, page: 1, language: "pt-BR", first_air_date_year: nil) { (return, series) in
            if let series = series {
                for serie in series {
                    if
                        let title = serie.name,
                        let id = serie.id,
                        let rating = serie.vote_average,
                        let overview = serie.overview,
                        let poster = serie.poster_path{
                        
                        let generic = GenericPopularMedia(id: id, title: title, rating: rating, overview: overview, poster: poster)
                        self.series.append(generic)
                    }
                }
               
                self.serieTableView.reloadData()
            }
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
    
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



extension SerieViewController: UISearchBarDelegate{
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        searchBar.resignFirstResponder()
        
        if (!(searchBar.text?.isEmpty ?? false)){
            getSearchSeries(searchText: searchBar.text ?? "")
        }else{
            self.series = []
            self.page = 1
            getPopularSeries(page: self.page)
        }
        
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
     

    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.endEditing(true)
        self.series = []
        self.page = 1
        getPopularSeries(page: self.page)
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
       
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
     
    }
    
}



