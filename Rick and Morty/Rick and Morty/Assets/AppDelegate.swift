//
//  AppDelegate.swift
//  Rick and Morty
//
//  Created by Alex Thompson on 2/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let navigationController = UINavigationController()
        let router = CharacterListRouter(navigationController: navigationController)
        let viewModel = CharacterListViewModel(router: router)
        let rootViewController = CharacterListViewController(viewModel: viewModel)
        
        navigationController.viewControllers = [rootViewController]
        navigationController.navigationBar.barTintColor = .lightGray
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}
