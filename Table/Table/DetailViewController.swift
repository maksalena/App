//
//  DetailViewController.swift
//  Table
//
//  Created by Алёна Максимова on 01.07.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var species: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var location: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var data: Resultss? {
        didSet {
            guard let data else { return }
            setUpData(data: data)
        }
    }
    
    func setUpData(data: Resultss) {
        avatar.download(from: data.image)
        name.text = data.name
        status.text = data.status.rawValue
        species.text = data.species.rawValue
        gender.text = data.gender.rawValue
        location.text = data.location.name
    }

}
