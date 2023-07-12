//
//  AppDelegate.swift
//  TodoListViper
//
//  Created by Алёна Максимова on 11.07.2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let todoListView = TodoListRouter.createTodoListModule()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = todoListView
        window?.makeKeyAndVisible()
        
        return true
    }

}

