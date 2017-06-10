//
//  AppDelegate.swift
//  arxiv-reader
//
//  Created by Santiago Aguilera on 6/9/17.
//  Copyright © 2017 Santiago Aguilera. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        
        let viewController = FeedViewController()
        
        window!.rootViewController = viewController
        
        window!.makeKeyAndVisible()
        return true
    }

}

