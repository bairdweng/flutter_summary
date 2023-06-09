//
//  FLNativeView.swift
//  FlutterGo
//
//  Created by bairdweng on 2023/5/30.
//

import UIKit

import Flutter
import SnapKit
class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FLNativeView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: nil)
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}

class FLNativeView: NSObject, FlutterPlatformView {
    private var _view: UIView
    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView(frame: frame)
        super.init()
        // iOS views can be created here
        createNativeView(view: _view,params: args)
    }

    func createNativeView(view _view: UIView, params:Any?) {
        
        let dic = params as? [String:Any];
        let test = dic?["test"] as? String ?? "默认的文字";
        _view.backgroundColor = UIColor.yellow
        let nativeLabel = UILabel()
        nativeLabel.text = test
        nativeLabel.textColor = UIColor.red
        nativeLabel.textAlignment = .center
        _view.addSubview(nativeLabel)
        nativeLabel.snp.makeConstraints { make in
            make.edges.equalTo(_view)
        }
    }

    func view() -> UIView {
        return _view
    }
}
