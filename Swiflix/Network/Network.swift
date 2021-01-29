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
        
        dbManager.collection("favoritos-\(uid)").document(m.title!).getDocument { (snapshot, error) in
            guard let snapshot = snapshot, error == nil else {
                print(error?.localizedDescription)
                onFail(error!.localizedDescription)
                return
            }
            
            snapshot.exists ? ifExists() : ifNotExists()
        }
    }
    
    func getFavorites(onSuccess: @escaping ([GenericMedia]) -> Void, onFail: @escaping (String) -> Void){
        guard let uid = self.getUID() else {
            print("erro - usuario nao logado")
            onFail("erro ao pegar uid do usuario")
            return
        }
        
        dbManager.collection("favoritos-\(uid)").getDocuments { (snapshot, error) in
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
    
    func favoriteMovie(data: [String:Any], success: @escaping () -> Void, fail: @escaping (String) -> Void){
        let uid = authManager.currentUser!.uid
        self.dbManager.collection("favoritos-\(uid)").document(data["title"] as! String).setData(data) { (error) in
            guard error == nil else {
                fail(error!.localizedDescription)
                return
            }
        }
        success()
    }
}
