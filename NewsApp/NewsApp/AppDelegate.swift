//
//  AppDelegate.swift
//  NewsApp
//
//  Created by b2c on 11/4/18.
//  Copyright © 2018 b2c. All rights reserved.
//

import UIKit
import Reachability

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var reachability:Reachability?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startNetworkNotifier()
        setRootViewController()
        
        return true
    }

    func setRootViewController()
    {
        let vc = NewsViewController.init(nibName: "NewsViewController", bundle: nil)
        let nvc = UINavigationController.init(rootViewController: vc)
        self.window!.rootViewController = nvc
        self.window!.makeKeyAndVisible()
    }

    func startNetworkNotifier()
    {
        reachability = Reachability()!
        do {
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    static var appdelegate: AppDelegate {
        get {
            return UIApplication.shared.delegate as! AppDelegate
        }
    }
}


