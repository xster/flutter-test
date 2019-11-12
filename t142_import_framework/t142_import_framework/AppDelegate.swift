//
//  AppDelegate.swift
//  t142_import_framework
//
//  Created by Xiao Yu on 11/11/19.
//  Copyright © 2019 Xiao Yu. All rights reserved.
//

import Flutter
import FlutterPluginRegistrant
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  let flutterEngine: FlutterEngine = {
    let engine = FlutterEngine.init(name: "my test a2a", project: nil)
    engine.run(withEntrypoint: nil)
    GeneratedPluginRegistrant.register(with: engine)
    return engine
  }()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    return true
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }


}

