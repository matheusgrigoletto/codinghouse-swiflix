//
//  PessoaTableViewCell.swift
//  Swiflix
//
//  Created by Bryan Barreto on 27/10/20.
//

import UIKit

class PessoaTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var department: UILabel!
    @IBOutlet weak var knowFor: UILabel!
    
    static let nibName: String = "PessoaTableViewCell"
    static let cellID:String = "PessoaCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(withPerson person: Person){
        self.name.text = person.name
        self.department.text = person.known_for_department
        
        var known:String = ""
        for value in person.known_for {
            if let title = value.title {
                known += "\(Utils.movie) \(title)\n"
            }
        }
//        known.removeLast()
//        known.removeLast()
        self.knowFor.text = known
        
        if let imageURL = URL(string: "\(Utils.baseImageURL)\(person.profile_path)") {
            do{
                let imageData = try Data(contentsOf: imageURL)
                self.profile.image = UIImage(data: imageData)
                self.profile.contentMode = .scaleAspectFill
            }catch{
                fatalError("error getting image from data")
            }
        }else{
            self.profile.image = UIImage(systemName: "person.fill.questionmark")
            self.profile.contentMode = .scaleAspectFit
        }
    }
    
}
