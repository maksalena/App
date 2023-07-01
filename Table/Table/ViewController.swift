//
//  ViewController.swift
//  Table
//
//  Created by Алёна Максимова on 26.06.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    var data: [Character] = [
        Character(id: 0, name: "Рик Санчез", status: .alive, species: "Человек", gender: .male, location: "Земля", image: UIImage(named: "Rick.jpg")),
        Character(id: 1, name: "Злой Морти", status: .alive, species: "Человек", gender: .male, location: "Цитадель", image: UIImage(named: "EvilMorty.jpg")),
        Character(id: 2, name: "Диана Санчез", status: .unknown, species: "Человек", gender: .female, location: "Земля", image: UIImage(named: "Diane.jpg")),
        Character(id: 3, name: "Мистер Жопосранчик", status: .alive, species: "Инопланетянин", gender: .genderless, location: "Неизвестно", image: UIImage(named: "Poopybutthole.jpg")),
        Character(id: 4, name: "Морти Смит", status: .alive, species: "Человек", gender: .male, location: "Земля", image: UIImage(named: "Morty.jpg"))
    ]

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let detailViewController = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else { return }
        
        detailViewController.delegate = self
        present(detailViewController, animated: true)
        detailViewController.data = data[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let characterCell = tableView.dequeueReusableCell(withIdentifier:"CharacterTableViewCell") as? CharacterTableViewCell
        else { return UITableViewCell() }
        
        let cellData = data[indexPath.row]
        characterCell.setUpData(data: cellData)
        return characterCell
    }
    
}

extension ViewController: DetailViewControllerDelegate {
    func updateCharacterData(with id: Int, status: Character.Status, location: String) {
        if let index = data.firstIndex(where: { $0.id == id }) {
            data[index].status = status
            data[index].location = location
            tableView.reloadData()
        }
        dismiss(animated: true)
    }
}
