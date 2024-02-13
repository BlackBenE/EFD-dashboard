//
//  AppDelegate.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 13/02/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let tabBarController = TabBarController()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController =  UINavigationController(rootViewController: ConnexionViewController()) //tabBarController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }

}

