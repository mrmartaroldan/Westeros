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
        let seasons = Repository.local.seasons
        
        // Controllers
        let housesDataSource = DataSources.housesDataSource(model: houses)
        let housesVC = ArrayTableViewController(arrayDataSource: housesDataSource,
                                                title: "Westeros",
                                                style: .plain,
                                                delegate: GreatHousesDelegate()).wrappedInNavigation()
        
        let seasonsDataSource = DataSources.seasonsDataSource(model: seasons)
        let seasonsVC = ArrayTableViewController(arrayDataSource: seasonsDataSource,
                                                title: "Seasons",
                                                style: .plain,
                                                delegate: SeasonsDelegate()).wrappedInNavigation()
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [housesVC, seasonsVC]
        
        // Window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.backgroundColor = UIColor.orange
        window?.makeKeyAndVisible()
        
        
        return true
    }

}

