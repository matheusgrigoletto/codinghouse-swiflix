//
//  SerieViewController.swift
//  Swiflix
//
//  Created by Bryan Barreto on 25/10/20.
//

import UIKit

class SerieViewController: UIViewController {

    @IBOutlet weak var serieTableView: UITableView!

    var series: [PopularMedia] = []

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
//        if let serie = sender as? TVPopularResponse.TV {
//            let vc = segue.destination as? SerieDetailViewController
//            vc?.serieId = serie.id
//        }
    }


    private func getPopularSeries() {
        
        TMDBTV.getPopular { (results, error) in
            
            if let _results = results {
                
                self.series = _results.results
                
            }
            
        }
        
    }

}

extension SerieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.series.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
