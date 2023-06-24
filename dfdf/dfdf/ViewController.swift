//
//  ViewController.swift
//  dfdf
//
//  Created by Алёна Максимова on 19.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Alyona Maksimova"
        uniLabel.text = "Education"
        uniNameLabel.text = "Innopolis"
        cityLabel.text = "City"
        cityNameLabel.text = "Saint-Petersburg"
        shortNameLabel.text = "AM"
        
        uniLabel.textColor = .lightGray
        cityLabel.textColor = .lightGray
        correctUniNameButton.tintColor = .lightGray
        correctCityNameButton.tintColor = .lightGray
        
        nameLabel.font = nameLabel.font.withSize(25)
        uniLabel.font = uniLabel.font.withSize(13)
        cityLabel.font = cityLabel.font.withSize(13)
        shortNameLabel.font = shortNameLabel.font.withSize(90)
        
        nameLabel = buttomBorder(label: nameLabel)
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width/1.55
        avatarImageView.backgroundColor = .lightGray
        avatarImageView.layer.opacity = 0.3
        
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            avatarImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)])
        
    }
    
    override func viewDidAppear(_ animated: Bool) {print(#function)}
    override func viewWillAppear(_ animated: Bool) {print(#function)}
    override func viewWillDisappear(_ animated: Bool) {print(#function)}
    override func viewDidDisappear(_ animated: Bool) {print(#function)}
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var correctUniNameButton: UIButton!
    @IBOutlet weak var correctCityNameButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortNameLabel: UILabel!
    
    @IBOutlet weak var uniLabel: UILabel!
    
    @IBOutlet weak var uniNameLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBAction func changeUni(_ sender: UIButton) {
        let alert = UIAlertController(title: "Enter new value", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
         
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Education"
        })
         
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { action in
         
            if let newName = alert.textFields?.first?.text {
                self.uniNameLabel.text = newName
                print("New education: \(newName)")
            }
        }))
         
        self.present(alert, animated: true)
    }
    
    @IBAction func changeCity(_ sender: UIButton) {
        let alert = UIAlertController(title: "Enter new value", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
         
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "City"
        })
         
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { action in
         
            if let newCity = alert.textFields?.first?.text {
                self.cityNameLabel.text = newCity
                print("New city: \(newCity)")
            }
        }))
         
        self.present(alert, animated: true)
    }
    
    func buttomBorder(label: UILabel) -> UILabel {
        let frame = label.frame
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0, y: frame.height + 15, width: frame.width + 60, height: 1.2)
        bottomLayer.backgroundColor = UIColor.darkGray.cgColor
        label.layer.addSublayer(bottomLayer)
        return label
    }
}

