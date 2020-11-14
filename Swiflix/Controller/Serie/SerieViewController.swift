//
//  SerieViewController.swift
//  Swiflix
//
//  Created by Bryan Barreto on 25/10/20.
//

import UIKit

class SerieViewController: UIViewController {

    @IBOutlet weak var serieTableView: UITableView!
    
    let series:[GenericMedia] = MockupSerie.getSeries()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureDelegates()
        self.registerCell()
    }
    
    func configureDelegates(){
        self.serieTableView.delegate = self
        self.serieTableView.dataSource = self
    }
    
    func registerCell(){
        let nib = UINib(nibName: GenericMediaTableViewCell.nibName, bundle: nil)
        self.serieTableView.register(nib, forCellReuseIdentifier: GenericMediaTableViewCell.cellID)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        #warning("passar o id da serie escolhida para a proxima tela")
        let serie = sender as? GenericMedia
        let vc = segue.destination as? SerieDetailViewController
        vc?.title = serie?.title ?? "Erro"
    }

}

extension SerieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.series.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GenericMediaTableViewCell.cellID, for: indexPath) as? GenericMediaTableViewCell
        cell?.setup(withMedia: self.series[indexPath.row])
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
