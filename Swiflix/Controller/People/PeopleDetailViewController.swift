//
//  PeopleDetailViewController.swift
//  Swiflix
//
//  Created by Vanessa Montagner on 10/11/20.
//

import UIKit

class PeopleDetailViewController: UIViewController {

  
    @IBOutlet weak var personTableView: UITableView!
    @IBOutlet weak var profile_path: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var department: UILabel!
    @IBOutlet weak var dateBirth: UILabel!
    @IBOutlet weak var dateDeath: UILabel!
    
   
    let fullPerson: FullPerson = MockupFullPerson.getFullPerson()
    let workMovies = MockupFullPerson.getWorks()
    let galery = MockupPhoto.getPhotos()

    var segmentedIndex = 0
    var personID:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureDelegates()

        self.registerCells(nibName: PersonBiographyTableViewCell.nibName, cellID: PersonBiographyTableViewCell.cellID)
        self.registerCells(nibName: GenericMediaTableViewCell.nibName, cellID: GenericMediaTableViewCell.cellID)
        self.registerCells(nibName: PersonGaleryTableViewCell.nibName, cellID: PersonGaleryTableViewCell.cellID)
        
        self.configureUIElements(fullPerson)
    }
    
    func configureUIElements(_ data: FullPerson){
        self.name.text = data.name
        self.department.text = data.known_for_department
        self.dateBirth.text = data.birthday
        self.dateDeath.text = data.deathday
        
        if let imageUrl = URL(string: "\(Utils.baseImageURL)\(self.fullPerson.profile_path)"){
            do{
                let imageData = try Data(contentsOf: imageUrl)
                self.profile_path.image = UIImage(data: imageData)
                self.profile_path.contentMode = .scaleAspectFill
                
            }catch{
                print(error.localizedDescription)
                self.profile_path.image = UIImage(systemName: "person" )
               
            }
        }else{
            self.profile_path.image = UIImage(systemName: "person")
            self.profile_path.contentMode = .scaleAspectFill
        }
    }
    
    func configureDelegates(){
        self.personTableView.delegate = self
        self.personTableView.dataSource = self
        
        
        
        self.personTableView.tableFooterView = UIView()
    }
    
    func registerCells(nibName: String, cellID: String){
        let nib = UINib(nibName: nibName, bundle: nil)
        self.personTableView.register(nib, forCellReuseIdentifier: cellID)
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        self.segmentedIndex = sender.selectedSegmentIndex
        self.personTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let filePath = sender as? String {
            let vc = segue.destination as? PhotoDetailViewController
            vc?.photoString = filePath
        }
    }
    
}

extension PeopleDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.segmentedIndex {
        case 0:
            tableView.allowsSelection = false
            return 1
        case 1:
            tableView.allowsSelection = true
            return self.workMovies.count
        case 2:
            tableView.allowsSelection = true
            tableView.rowHeight = tableView.frame.height
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.segmentedIndex {
        case 0: //Biografia
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonBiographyTableViewCell.cellID, for: indexPath) as? PersonBiographyTableViewCell
            cell?.setup(self.fullPerson)
            return cell ?? UITableViewCell()
        case 1: // filmes trabalhados
            let cell = tableView.dequeueReusableCell(withIdentifier: GenericMediaTableViewCell.cellID, for: indexPath) as? GenericMediaTableViewCell
            cell?.setup(withMedia: self.workMovies[indexPath.row])
            return cell ?? UITableViewCell()
        case 2: // Galeria
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonGaleryTableViewCell.cellID, for: indexPath) as? PersonGaleryTableViewCell
            cell?.setup(self.galery)
            cell?.photoClickDelegate = self
            return cell ?? UITableViewCell()
        default:
          return UITableViewCell()
        }
    }
    
    
}

extension PeopleDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension PeopleDetailViewController: PersonGaleryTableViewCellDelegate {
    func tappedPhoto(file_path: String) {
        self.performSegue(withIdentifier: Segues.toPhotoGalleryDetail, sender: file_path)
    }
}
