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

    var series: [Serie] = []

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
        if let serie = sender as? Serie {
            let vc = segue.destination as? SerieDetailViewController
            vc?.setupCell(with: serie)
        }
    }


    private func getPopularSeries() {
        TVMDB.popular(page: 1, language: "pt-BR") { (return, series) in
            if let series = series {
                for serie in series {
                    if let backdrop = serie.backdrop_path,
                       let id = serie.id,
                       let originalTitle = serie.original_name,
                       let overview = serie.overview,
                       let poster = serie.poster_path,
                       let releaseDate = serie.first_air_date,
                       let title = serie.name,
                       let vote = serie.vote_average {
                        let media = Serie(backdrop: backdrop, genres: [], homePage: nil, id: id, originalTitle: originalTitle, overview: overview, poster: poster, releaseDate: releaseDate, runtime: nil, title: title, vote: vote)
                        self.series.append(media)
                    }
                }
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
