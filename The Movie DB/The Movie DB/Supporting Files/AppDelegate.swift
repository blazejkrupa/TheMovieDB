//
//  AppDelegate.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/3/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setWindow()
        return true
    }
    
    private func setWindow() {
        self.window = UIWindow()
        let rootNC = UINavigationController(rootViewController: MoviesTableViewController())
        self.window?.rootViewController = rootNC
        self.window?.makeKeyAndVisible()
    }
}

