//
//  PeopleTableViewCell.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 31/10/20.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var actorNameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var knownWorksLabel: UILabel!
    @IBOutlet weak var portraitView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(person: Person, credits: Credit){
        
        self.actorNameLabel.text = person.name
        self.jobLabel.text = person.knownForDepartment
        self.knownWorksLabel.text = credits.cast?
            .map( { $0.title ?? "" } )
            .joined(separator: ", ")
        
        if let imageURL = URL(string: "\(Utils.imageBaseURL)\(person.profilePath ?? "")") {
            do {
                let imageData = try Data(contentsOf: imageURL)
                self.portraitView.image = UIImage(data: imageData)
            }catch {
                fatalError("error getting image data from url (\(imageURL.absoluteString)): file \(#file) on line \(#line)")
            }
        }else{
            self.portraitView.image = UIImage(systemName: "person.crop.circle")
        }
        
    }
    
}
