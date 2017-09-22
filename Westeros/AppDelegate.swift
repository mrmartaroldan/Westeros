//
//  AppDelegate.swift
//  Westeros
//
//  Created by Marta Roldán Arellano on 4/7/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Model
        let houses = Repository.local.houses
        
        // Controllers
        let housesDataSource = DataSources.housesDataSource(model: houses)
        let housesVC = ArrayTableViewController(arrayDataSource: housesDataSource,
                                                title: "Westeros",
                                                style: .plain,
                                                delegate:
            GreatHousesDelegate()).wrappedInNavigation()
        
        
        // Window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = housesVC
        window?.backgroundColor = UIColor.orange
        window?.makeKeyAndVisible()
        
        
        return true
    }

}

