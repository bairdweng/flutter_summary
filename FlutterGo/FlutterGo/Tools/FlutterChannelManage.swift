//
//  FlutterChannelManage.swift
//  FlutterGo
//
//  Created by bairdweng on 2023/6/12.
//

import Flutter
import UIKit
class FlutterChannelManage: NSObject {
    static let single = FlutterChannelManage()
    var channelList = [FlutterMethodChannel]()

    func callMethods(name: String, params: [String: Any]) {
        for channel in channelList {
            channel.invokeMethod(name, arguments: params)
        }
    }
}
