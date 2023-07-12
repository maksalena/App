//
//  TodoListProtocols.swift
//  TodoListViper
//
//  Created by Алёна Максимова on 11.07.2023.
//

import UIKit

protocol TodoListViewProtocol: class {
    
    var presenter: TodoListPresenterProtocol? { get set }
    
    func showTodos(_ todos: [TodoItem])
    func showErrorMessage(_ message: String)
}

protocol TodoListPresenterProtocol: class {
    
    var view: TodoListViewProtocol? { get set }
    var interactor: TodoListInteractorInputProtocol? { get set }
    var router: TodoListRouterProtocol? { get set }
    
    func viewWillAppear()
    func showTodoDetail(_ Todo: TodoItem)
    func addTodo(_ todo: TodoItem)
    func removeTodo(_ todo: TodoItem)
}

protocol TodoListInteractorInputProtocol: class {
    
    var presenter: TodoListInteractorOutputProtocol? { get set }
    
    func retrieveTodos()
    func saveTodo(_ todo: TodoItem)
    func deleteTodo(_ todo: TodoItem)
}

protocol TodoListInteractorOutputProtocol: class {
    
    func didAddTodo(_ todo: TodoItem)
    func didRemoveTodo(_ todo: TodoItem)
    func didRetrieveTodos(_ todos: [TodoItem])
    func onError(message: String)
}

protocol TodoListRouterProtocol: class {
    
    static func createTodoListModule() -> UIViewController
    
    func presentToDoDetailScreen(from view: TodoListViewProtocol, for todo: TodoItem)
}
