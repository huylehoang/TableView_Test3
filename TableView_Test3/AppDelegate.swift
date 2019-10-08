//
//  AppDelegate.swift
//  TableView_Test3
//
//  Created by LeeX on 9/22/19.
//  Copyright © 2019 LeeX. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let collectionVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        collectionVC.subView = .collection
        collectionVC.tabBarItem.title = SubView.collection.rawValue
        
        let tableVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        tableVC.subView = .table
        tableVC.tabBarItem.title = SubView.table.rawValue
        
        let tabBarController = UITabBarController()
        window?.rootViewController = tabBarController
        tabBarController.viewControllers = [collectionVC, tableVC]
        tabBarController.tabBar.tintColor = UIColor.darkText
        tabBarController.tabBar.barTintColor = UIColor.white
        tabBarController.tabBar.unselectedItemTintColor = UIColor.darkGray.withAlphaComponent(0.7)
        UITabBarItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .regular)],
            for: .normal)
        
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

