//
//  PerfilViewController.swift
//  Swiflix
//
//  Created by Bryan Barreto on 17/11/20.
//

import UIKit
import Firebase
import FirebaseStorage



class PerfilViewController: UIViewController {
    
    @IBOutlet weak var favoriteTableView: UITableView!
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var mudarSenhaBtn: UIButton!
    
    var segmentedIndex:Int = 0
    var favoriteMovies: [GenericMedia] = []
    var favoriteSeries = MockupSerie.getSeries()
    
    let storage = Storage.storage()
    
    override func viewDidLoad() {
        getAuthInfo()
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        super.viewDidLoad()
        escondeTecladoClicandoFora()
        self.configureUI()
        self.configureTableView()
        
        self.fetchFavoriteMovies()
        
        self.downloadUserImage()
        
        self.configureUserImage()
    }
    
    private func downloadUserImage() {
        
        if let user = Auth.auth().currentUser?.uid {
            let storageRef = self.storage.reference()
            let imagesRef = storageRef.child("\(user).jpg")
            imagesRef.getData(maxSize: 3 * 1024 * 1024) { (image, error) in
                if let image = image {
                    UserProfile.shared.image = UIImage(data: image)
                    self.configureUserImage()
                } else {
                    print("===Erro ao baixar imagem do usuário===")
                }
            }
        }
        
    }
    
    private func fetchFavoriteMovies(){
        Network.shared.getFavorites { (medias) in
            //success
            self.favoriteMovies = medias
            self.favoriteTableView.reloadData()
        } onFail: { (error) in
            self.showAlert(title: "erro", message: error)
        }
        
    }
    
    func configureTableView(){
        self.favoriteTableView.delegate = self
        self.favoriteTableView.dataSource = self
        self.favoriteTableView.allowsSelection = false
        self.favoriteTableView.tableFooterView = UIView()
        
        let nib = UINib(nibName: GenericMediaTableViewCell.nibName, bundle: nil)
        self.favoriteTableView.register(nib, forCellReuseIdentifier: GenericMediaTableViewCell.cellID)
    }
    
    func configureUserImage(){
        self.userImage.layer.borderWidth = 1
        self.userImage.layer.masksToBounds = false
        self.userImage.layer.borderColor = UIColor.black.cgColor
        self.userImage.layer.cornerRadius = self.userImage.frame.height/2
        self.userImage.clipsToBounds = true
        self.userImage.image = UserProfile.shared.image ?? UIImage(systemName: "person")
        self.userImage.contentMode = .scaleAspectFill
    }
    
    func configureUI(){
        self.title = "Perfil"
        mudarSenhaBtn.layer.cornerRadius = mudarSenhaBtn.layer.frame.height / 2
        //        try! Auth.auth().signOut()
        let logoutButton = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logout))
        self.navigationItem.rightBarButtonItem = logoutButton
    }
    
    func getAuthInfo(){
        
        guard let usuarioID = Auth.auth().currentUser?.uid else{
            print("erro buscando nome de usuario no banco")
            return
        }
        Firestore.firestore().collection("usuario").document(usuarioID).getDocument { (foto, erro) in
            guard let fotoDoBanco = foto?.data() else {
                print(erro?.localizedDescription)
                return
            }
            guard let nome = fotoDoBanco["nome"] else {
                return
            }
            
            
            let email = Auth.auth().currentUser?.email
            self.emailLabel.text = email
            self.nomeLabel.text = nome as! String
        }
        
        //        nomeLabel.text = nome as! String
        
    }
    
    
    
    @objc func logout(){
        self.showConfirmAlert(title: "Logout", message: "Deseja realizar logout?", okHandler: { _ in
            try! Auth.auth().signOut()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateInitialViewController()
            self.view.window?.rootViewController = vc
            print("logging out...")
        }, cancelHandler: nil)
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        self.segmentedIndex = sender.selectedSegmentIndex
        self.favoriteTableView.reloadData()
    }
}

extension PerfilViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount = self.segmentedIndex == 0 ? self.favoriteMovies.count : self.favoriteSeries.count
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GenericMediaTableViewCell.cellID, for: indexPath) as? GenericMediaTableViewCell
        let media = self.segmentedIndex == 0 ? self.favoriteMovies[indexPath.row] : self.favoriteSeries[indexPath.row]
        cell?.setup(withMedia: media)
        return cell ?? UITableViewCell()
    }
    
}


extension PerfilViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let uid = Auth.auth().currentUser?.uid.description
        if self.segmentedIndex == 0 {
            print("=====REMOVENDO FILME FAVORITADO====")
            Firestore.firestore().collection("favoritos").document(uid as! String).collection("meusFavoritos").document(favoriteMovies[indexPath.row].title).delete()
            
            self.favoriteMovies.remove(at: indexPath.row)
            
        }else{
            self.favoriteSeries.remove(at: indexPath.row)
            print("=====REMOVENDO SERIE FAVORITADA====")
            
        }
        
        tableView.deleteRows(at: [indexPath], with: .fade)
        
    }
    
}



