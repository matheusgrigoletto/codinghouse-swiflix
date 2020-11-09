//
//  PeopleViewController.swift
//  Swiflix
//
//  Created by Vanessa Montagner on 26/10/20.
//

import UIKit

class PeopleViewController: UIViewController {

    @IBOutlet weak var peopleTableView: UITableView!
    
    let pessoas = MockupPerson.getPeople()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureDelegates()
        self.registerCell()
    }
    
    func configureDelegates(){
        self.peopleTableView.delegate = self
        self.peopleTableView.dataSource = self
    }
    
    func registerCell(){
        let nib = UINib(nibName: PessoaTableViewCell.nibName, bundle: nil)
        self.peopleTableView.register(nib, forCellReuseIdentifier: PessoaTableViewCell.cellID)
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
    
}
