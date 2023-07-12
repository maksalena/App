//
//  TodoDetailProtocols.swift
//  TodoListViper
//
//  Created by Алёна Максимова on 11.07.2023.
//

import UIKit

protocol TodoDetailViewProtocol: class {
    
    var presenter: TodoDetailPresenterProtocol? { get set }
    
    func showToDo(_ todo: TodoItem)
}

protocol TodoDetailPresenterProtocol: class {
    
    var view: TodoDetailViewProtocol? { get set }
    var interactor: TodoDetailInteractorInputProtocol? { get set }
    var router: TodoDetailRouterProtocol? { get set }
    
    func viewDidLoad()
    func editTodo(title: String, content: String)
    func deleteTodo()
}

protocol TodoDetailInteractorInputProtocol: class {
    
    var presenter: TodoDetailInteractorOutputProtocol? { get set }
    var todoItem: TodoItem? { get set }
    
    func deleteTodo()
    func editTodo(title: String, content: String)
}

protocol TodoDetailInteractorOutputProtocol: class {
    
    func didDeleteTodo()
    func didEditTodo(_ todo: TodoItem) 
}

protocol TodoDetailRouterProtocol: class {
    
    static func createTodoDetailRouterModule(with todo: TodoItem) -> UIViewController
    
    func navigateBackToListViewController(from view: TodoDetailViewProtocol)
    
}
