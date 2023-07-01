//
//  CharacterTableViewCell.swift
//  Table
//
//  Created by Алёна Максимова on 30.06.2023.
//

import UIKit

struct Character {
    enum Status {
        case alive
        case dead
        case unknown
    }
    
    enum Gender {
        case female
        case male
        case genderless
        case unknown
    }
    
    let id: Int
    let name: String
    var status: Status
    let species: String
    let gender: Gender
    var location: String
    let image: UIImage?
}

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpData(data: Character) {
        avatar.image = data.image
        name.text = data.name
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatar.image = nil
        name.text = nil
    }

}
