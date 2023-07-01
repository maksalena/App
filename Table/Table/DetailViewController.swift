//
//  DetailViewController.swift
//  Table
//
//  Created by Алёна Максимова on 01.07.2023.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    func updateCharacterData(with id: Int, status: Character.Status, location: String)
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var species: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var location: UILabel!
    
    weak var delegate: DetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var data: Character? {
        didSet {
            guard let data else { return }
            setUpData(data: data)
        }
    }
    
    func setUpData(data: Character) {
        avatar.image = data.image
        name.text = data.name
        status.text = setUpStatus(status: data.status)
        species.text = data.species
        gender.text = setUpGender(gender: data.gender)
        location.text = data.location
    }
    
    func setUpStatus(status: Character.Status) -> String {
        switch status {
        case .alive:
                return "Жив"
        case .dead:
            return "Мертв"
        case .unknown:
            return "Статус неизвестен"
        default:
            "Статус неизвестен"
        }
    }
    
    func setUpStatus(status: String) -> Character.Status {
        switch status {
        case "Жив":
            return Character.Status.alive
        case "Мертв":
            return Character.Status.dead
        case "Статус неизвестен":
            return Character.Status.unknown
        default:
            return Character.Status.unknown
        }
    }
    
    func setUpGender(gender: Character.Gender) -> String {
        switch gender {
        case .female:
            return "Женщина"
        case .male:
            return "Мужчина"
        case .genderless:
            return "Без пола"
        case .unknown:
            return "Пол неизвестен"
        }
    }
    
    @IBAction func changeStatus(_ sender: UIButton) {
        let alert = UIAlertController(title: "Введите новый статус", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
         
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Статус: Жив, Мертв, Статус неизвестен"
        })
         
        alert.addAction(UIAlertAction(title: "Готово", style: .default, handler: { [self] action in
         
            if let newStatus = alert.textFields?.first?.text {
                print("New status: \(newStatus)")
                guard let data else { return }
                delegate?.updateCharacterData(with: data.id, status: setUpStatus(status: newStatus), location: data.location)
            }
        }))
         
        self.present(alert, animated: true)
    }
    
    @IBAction func changeLocation(_ sender: UIButton) {
        let alert = UIAlertController(title: "Введите новую локацию", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
         
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Новая локация"
        })
         
        alert.addAction(UIAlertAction(title: "Готово", style: .default, handler: { [self] action in
         
            if let newLocation = alert.textFields?.first?.text {
                print("New location: \(newLocation)")
                guard let data else { return }
                delegate?.updateCharacterData(with: data.id, status: data.status, location: newLocation)
            }
        }))
         
        self.present(alert, animated: true)
    }
}
