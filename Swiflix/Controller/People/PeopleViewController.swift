
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
    let cellSpacingHeight: CGFloat = 5
    var page: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureDelegates()
        self.registerCell()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        self.getPeoples(page: self.page)
    }
    
    private func getPeoples(page: Int) {
        print(page)
        TMDBPeople.getPopular(language: "pt-BR", page: page) { (people, error) in
            print(people)
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
