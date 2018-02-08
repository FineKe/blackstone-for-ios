//
//  AppDelegate.swift
//  blackstone
//
//  Created by fine fine.com on 2018/2/7.
//  Copyright © 2018年 fine.com. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UITabBarControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let tabBarController = window?.rootViewController as! UITabBarController

//        let tabBarController  = UITabBarController()
//
//        let speciesViewController = SpeciesController()
//        let guideViewController = GuideViewController()
//        let recordViewController = RecordViewController()
//        let meViewController = MeViewController()
//        let settingViewController = SettingViewController()
//
//        //设置tabbar的子控制器集合
//        tabBarController.viewControllers = [UINavigationController(rootViewController: speciesViewController),
//                                            guideViewController,recordViewController,meViewController,
//                                            settingViewController]
        let tabBarItems = tabBarController.tabBar.items
//
        let tabBarItem1 = tabBarItems![0]
        let tabBarItem2 = tabBarItems![1]
        let tabBarItem3 = tabBarItems![2]
        let tabBarItem4 = tabBarItems![3]
        let tabBarItem5 = tabBarItems![4]

        //设置图片
        tabBarItem1.selectedImage = #imageLiteral(resourceName: "物种蓝").withRenderingMode(.alwaysOriginal)
        tabBarItem1.image = #imageLiteral(resourceName: "物种灰").withRenderingMode(.alwaysOriginal)
        tabBarItem1.title = "物种"

        tabBarItem2.selectedImage = #imageLiteral(resourceName: "蓝指南").withRenderingMode(.alwaysOriginal)
        tabBarItem2.image = #imageLiteral(resourceName: "灰指南").withRenderingMode(.alwaysOriginal)
        tabBarItem2.title = "指南"

        tabBarItem3.selectedImage = #imageLiteral(resourceName: "蓝添加").withRenderingMode(.alwaysOriginal)
        tabBarItem3.image = #imageLiteral(resourceName: "灰添加").withRenderingMode(.alwaysOriginal)
        tabBarItem3.title = "添加记录"

        tabBarItem4.selectedImage = #imageLiteral(resourceName: "蓝记录").withRenderingMode(.alwaysOriginal)
        tabBarItem4.image = #imageLiteral(resourceName: "灰记录").withRenderingMode(.alwaysOriginal)
        tabBarItem4.title = "个人中心"

        tabBarItem5.selectedImage = #imageLiteral(resourceName: "蓝设置").withRenderingMode(.alwaysOriginal)
        tabBarItem5.image = #imageLiteral(resourceName: "灰设置").withRenderingMode(.alwaysOriginal)
        tabBarItem5.title = "设置"
//
//        tabBarController.view.backgroundColor = UIColor.white
//        tabBarController.hidesBottomBarWhenPushed = true
//        tabBarController.delegate = self
//        window?.rootViewController = tabBarController


        return true
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

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
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "blackstone")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

