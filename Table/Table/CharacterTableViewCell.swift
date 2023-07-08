//
//  CharacterTableViewCell.swift
//  Table
//
//  Created by Алёна Максимова on 30.06.2023.
//

import UIKit

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
    
    func setUpData(data: Resultss) {
        avatar.download(from: data.image)
        name.text = data.name
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatar.image = nil
        name.text = nil
    }

}
