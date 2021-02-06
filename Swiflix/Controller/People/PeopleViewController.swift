
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
    @IBOutlet weak var searchBar: UISearchBar!
    
    var pessoas: [Person] = []
    let cellSpacingHeight: CGFloat = 5
    var page: Int = 1
    
    //alksjaksljksaldj
    
    override func viewDidLoad() {
        searchBar.placeholder = "Procure por um ator ou atriz"
        
        super.viewDidLoad()
        self.configureDelegates()
        self.registerCell()
        self.peopleTableView.keyboardDismissMode = .onDrag
        self.getPeoples(page: self.page)
    }
    
    
    private func getSearchPeoples(searchText: String){
        self.pessoas = []
        
        TMDBPeople.search(query: searchText, language: "pt-BR", page: 1, includeAdult: false, region: nil) { (people, error) in
            
            if let people = people {
                self.pessoas.append(contentsOf: people.results)
            }else {
                print(error?.localizedDescription)
            }
            DispatchQueue.main.async {
                self.peopleTableView.reloadData()
            }
        }
        
    }
    
    private func getPeoples(page: Int) {
      
        
        TMDBPeople.getPopular(language: "pt-BR", page: page) { (people, error) in
            
            if let people = people {
                self.pessoas.append(contentsOf: people.results)
            }else {
                print(error?.localizedDescription)
            }
            DispatchQueue.main.async {
                self.peopleTableView.reloadData()
            }
            self.page += 1
        }
    }
    
    func configureDelegates(){
        self.peopleTableView.delegate = self
        self.peopleTableView.dataSource = self
        self.searchBar.delegate = self
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

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pessoas.count
}
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                if self.pessoas.count - 1 == indexPath.row {
            self.getPeoples(page: self.page)
        }
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

extension PeopleViewController: UISearchBarDelegate{
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        searchBar.resignFirstResponder()
        
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
     

    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
       
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if (!searchText.isEmpty){
            getSearchPeoples(searchText: searchText)
        }else{
            self.pessoas = []
            self.page = 1
            getPeoples(page: self.page)
        }
        
    }
    
}
