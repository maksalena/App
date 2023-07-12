//
//  TodoDetailPresenter.swift
//  TodoListViper
//
//  Created by Алёна Максимова on 11.07.2023.
//

import UIKit

class TodoDetailPresenter: TodoDetailPresenterProtocol {

    weak var view: TodoDetailViewProtocol?
    var router: TodoDetailRouterProtocol?
    var interactor: TodoDetailInteractorInputProtocol?
    
    
    func viewDidLoad() {
        if let todoItem = interactor?.todoItem {
            view?.showToDo(todoItem)
        }
    }
    
    func editTodo(title: String, content: String) {
        interactor?.editTodo(title: title, content: content)
    }
    
    func deleteTodo() {
        interactor?.deleteTodo()
    }
    
}

extension TodoDetailPresenter: TodoDetailInteractorOutputProtocol {
    
    func didDeleteTodo() {
        if let view = view {
            router?.navigateBackToListViewController(from: view)
        }
    }
    
    func didEditTodo(_ todo: TodoItem) {
        view?.showToDo(todo)
    }
    
}
