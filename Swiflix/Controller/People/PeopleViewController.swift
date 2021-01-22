
//
//  PeopleViewController.swift
//  Swiflix
//
//  Created by Vanessa Montagner on 26/10/20.
//


import UIKit
import TMDBSwift

class PeopleViewController: UIViewController {

    @IBOutlet weak var peopleTableView: UITableView!
    
    var pessoas: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureDelegates()
        self.registerCell()
        escondeTecladoClicandoFora()
        self.getMovies()
    }
    
    private func getMovies() {
        TMDBPeople.getPopular { (people, error) in
            if let people = people {
                self.pessoas = people.results
            }
            DispatchQueue.main.async {
                self.peopleTableView.reloadData()
            }
        }
    }
    
    func configureDelegates(){
        self.peopleTableView.delegate = self
        self.peopleTableView.dataSource = self
    }
    
    func registerCell(){
        let nib = UINib(nibName: PessoaTableViewCell.nibName, bundle: nil)
        self.peopleTableView.register(nib, forCellReuseIdentifier: PessoaTableViewCell.cellID)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        #warning("passar o id do filme escolhido para a proxima tela")
        let people = sender as? Person
        let vc = segue.destination as? PeopleDetailViewController
        vc?.title = people?.name
        vc?.personID = people?.id
    }
}

extension PeopleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pessoas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PessoaTableViewCell.cellID, for: indexPath) as? PessoaTableViewCell
        cell?.setup(withPerson: self.pessoas[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    
}

extension PeopleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        #warning("performar segue enviando o id do filme escolhido")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let chosenPeople = self.pessoas[indexPath.row]
        performSegue(withIdentifier: Segues.toPersonDetail, sender: chosenPeople)
    }
}
