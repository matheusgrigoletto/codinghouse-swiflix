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

    var series: [TVPopularResponse.TV] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureDelegates()
        self.registerCell()

        self.getPopularSeries()
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
//        if let serie = sender as? Tv {
//            let vc = segue.destination as? SerieDetailViewController
//            vc?.setupCell(with: serie)
//        }
    }


    private func getPopularSeries() {
        
        TMDB.TV.getPopular { (results, error) in
            
            if let _results = results {
                
                self.series = _results.results
                
            }
            
        }
//        TVMDB.popular(page: 1, language: "pt-BR") { (return, series) in
//            if let series = series {
//
//                series.forEach( { self.series.append(Tv.parse(from: $0)) } )
//                self.serieTableView.reloadData()
//
//            }
//        }
    }

}

extension SerieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.series.count
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GenericMediaTableViewCell.cellID, for: indexPath) as? GenericMediaTableViewCell
//        cell?.setup(withSerie: self.series[indexPath.row])
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
