//
//  ViewController.swift
//  Table
//
//  Created by Алёна Максимова on 26.06.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    private let manager = NetworkManager()
    private var characters: CharacterResponseModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadCharacters()
    }
    
    func loadCharacters() {
        manager.fetchCharacters { result in
            switch result {
            case let .success(response):
                self.characters = response
                print(response)
                self.tableView.reloadData()
            case .failure:
                print("error")
            }
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let detailViewController = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else { return }
        
        present(detailViewController, animated: true)
        detailViewController.data = characters?.results[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let characterCell = tableView.dequeueReusableCell(withIdentifier:"CharacterTableViewCell") as? CharacterTableViewCell
        else { return UITableViewCell() }
        
        if let character = characters?.results[indexPath.row] {
            characterCell.setUpData(data: character)
        }
        
        return characterCell
    }
    
}

