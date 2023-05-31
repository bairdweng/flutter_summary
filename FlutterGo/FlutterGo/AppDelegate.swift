//
//  AppDelegate.swift
//  FlutterGo
//
//  Created by bairdweng on 2023/5/30.
//

import Flutter
import FlutterPluginRegistrant
import UIKit

//class MYFlutterPlgins: NSObject,FlutterPlugin {
//    static func register(with registrar: FlutterPluginRegistrar) {
//        let factory = FLNativeViewFactory(messenger: registrar.messenger())
//        registrar.register(factory, withId: "platform_text_view")
//    }
//}


@main
class AppDelegate: FlutterAppDelegate {

    // 多实例的Flutter
    let engines = FlutterEngineGroup(name: "multiple-flutters", project: nil)

    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
