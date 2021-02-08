//
//  Network.swift
//  Swiflix
//
//  Created by Bryan Barreto on 28/01/21.
//

import Foundation
import Firebase
import TMDBSwift

class Network {
    static let shared = Network()
    
    let dbManager = Firestore.firestore()
    let authManager = Auth.auth()
    
    
    func getUID() -> String? {
        return authManager.currentUser?.uid
    }
    
    func verificarFilmeFavorito(m: MovieDetailedMDB, ifExists: @escaping () -> Void, ifNotExists: @escaping () -> Void, onFail: @escaping (String) -> Void){
        guard let uid = self.getUID() else {
            print("erro - usuario nao logado")
            onFail("erro ao pegar uid do usuario")
            return
        }
        
        //Alteracao 1
        dbManager.collection("favoritos").document(uid.description).collection("meusFavoritos").document(m.title!).getDocument { (snapshot, error) in
            guard let snapshot = snapshot, error == nil else {
                print(error?.localizedDescription)
                onFail(error!.localizedDescription)
                return
            }
            print("=-=-=-=--=-????? FUNCAO VERIFICAR FILME FAVORITO ????=-=--=--=-=-=-=-=")
            snapshot.exists ? ifExists() : ifNotExists()
        }
    }
    
    
    //MARK: - Carregar Favoritos
    
    func getFavorites(mediaType: MediaType, onSuccess: @escaping ([GenericMedia]) -> Void, onFail: @escaping (String) -> Void){
        guard let uid = self.getUID() else {
            print("erro - usuario nao logado")
            onFail("erro ao pegar uid do usuario")
            return
        }
        
        var folder: String
        
        switch mediaType {
        case .movie:
            folder = "meusFavoritos"
        case .serie:
            folder = "seriesFavoritas"
        }
        
        //Alteracao 2
        dbManager.collection("favoritos").getDocuments { (snapshot, error) in
            self.dbManager.collection("favoritos").document(self.getUID()?.description as! String).collection(folder).getDocuments { (snapshot, error) in
                guard let snapshot = snapshot, !snapshot.isEmpty, error == nil else {
                    onFail("ops, aconteceu algum erro")
                    return
                }
                
                var medias: [GenericMedia] = []
                for doc in snapshot.documents {
                    let data = doc.data()
                    let id = data["id"] as! Int
                    let title = data["title"] as! String
                    let vote = data["vote_average"] as! Double
                    let overview = data["overview"] as! String
                    let poster = data["poster_path"] as! String
                    
                    let media = GenericMedia(id: id, title: title, rating: vote, overview: overview, poster: poster)
                    
                    medias.append(media)
                }
                
                onSuccess(medias)
            }
        }
    }
    
    func favoriteMovie(data: [String:Any], success: @escaping () -> Void, fail: @escaping (String) -> Void){
        let uid = authManager.currentUser!.uid
        let dataFav = data["title"] as! String
        self.dbManager.collection("favoritos").document(uid.description as! String).collection("meusFavoritos").document(dataFav as! String).setData(data) { (error) in
            guard error == nil else {
                fail(error!.localizedDescription)
                return
            }
        }
        success()
    }
    
    func verificarSerieFavorita(m: MediaDetailResponse, ifExists: @escaping () -> Void, ifNotExists: @escaping () -> Void, onFail: @escaping (String) -> Void){
        guard let uid = self.getUID() else {
            print("erro - usuario nao logado")
            onFail("erro ao pegar uid do usuario")
            return
        }
        
        
        dbManager.collection("favoritos").document(uid.description).collection("seriesFavoritas").document(m.name!).getDocument { (snapshot, error) in
            guard let snapshot = snapshot, error == nil else {
                print(error?.localizedDescription)
                onFail(error!.localizedDescription)
                return
            }
            print("=-=-=-=--=-????? FUNCAO VERIFICAR SÉRIE FAVORITO ????=-=--=--=-=-=-=-=")
            snapshot.exists ? ifExists() : ifNotExists()
        }
    }
    
    func favoriteSerie(data: [String:Any], success: @escaping () -> Void, fail: @escaping (String) -> Void){
        let uid = authManager.currentUser!.uid
        let dataFav = data["title"] as! String
        self.dbManager.collection("favoritos").document(uid.description as! String).collection("seriesFavoritas").document(dataFav as! String).setData(data) { (error) in
            guard error == nil else {
                fail(error!.localizedDescription)
                return
            }
        }
        success()
    }
    
}

enum MediaType {
    case movie
    case serie
}
