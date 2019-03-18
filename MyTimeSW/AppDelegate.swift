//
//  AppDelegate.swift
//  MyTimeSW
//
//  Created by Timothy Santiago on 13/03/2019.
//  Copyright © 2019 Timothy Santiago. All rights reserved.
//

import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import SharkORM

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, SRKDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        MSAppCenter.start("e85af577-efdb-4151-b564-55bdfe9b7b32", withServices:[
            MSAnalytics.self,
            MSCrashes.self
        ])
        MSAppCenter.setLogLevel(.none);
        
        SharkORM.setDelegate(self)
        SharkORM.openDatabaseNamed("MTDatabase")
        
        // setup main navigation controller
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        let mainViewController = MainNavigationViewController()
        window!.rootViewController = mainViewController
        window!.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }


}

