//
//  AppDelegate.swift
//  FlutterGo
//
//  Created by bairdweng on 2023/5/30.
//

import Flutter
import FlutterPluginRegistrant
import UIKit




@main
class AppDelegate: FlutterAppDelegate {

    // 多实例的Flutter
    let engines = FlutterEngineGroup(name: "multiple-flutters", project: nil)

    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        GeneratedPluginRegistrant.register(with: self);
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
