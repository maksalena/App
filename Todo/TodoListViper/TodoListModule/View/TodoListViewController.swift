//
//  TodoListViewController.swift
//  TodoListViper
//
//  Created by Алёна Максимова on 11.07.2023.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var presenter: TodoListPresenterProtocol?
    var todos: [TodoItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0 ..< (UserDefaults.standard.array(forKey: "Array")?.count ?? 0) {
            let todo = UserDefaults.standard.array(forKey: "Array")?[i] as! Array<String>
            guard todo.count == 2 else { continue }
            todos.append(TodoItem(title: todo[0], content: todo[1]))
        }
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
    }

    
    private func setupView() {
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.title
        cell.detailTextLabel?.text = todo.content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todos[indexPath.row]
        presenter?.showTodoDetail(todo)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let todoItem = todos[indexPath.row]
            presenter?.removeTodo(todoItem)
        }
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Todo Item", message: "Enter title and content", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self](_) in
            let titleText = alertController.textFields![0].text ?? ""
            let contentText = alertController.textFields![1].text ?? ""
            guard !titleText.isEmpty else { return }
            let todoItem = TodoItem(title: titleText, content: contentText)
            self?.presenter?.addTodo(todoItem)
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}

extension TodoListViewController: TodoListViewProtocol {
    
    func showTodos(_ todos: [TodoItem]) {
        self.todos = todos
    }
    
    func showErrorMessage(_ message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}
