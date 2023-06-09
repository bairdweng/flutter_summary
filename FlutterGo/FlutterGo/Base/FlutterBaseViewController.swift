//
//  FlutterBaseViewController.swift
//  FlutterGo
//
//  Created by bairdweng on 2023/5/30.
//

import Flutter
import FlutterPluginRegistrant
import UIKit

@objc protocol FlutterBaseVcDelegate {
    func callMethods(vc: FlutterBaseViewController?, funtionName: String?, params: Any?)
}

class FlutterBaseViewController: FlutterViewController {
    var delegate: FlutterBaseVcDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // 通道
        channel = FlutterMethodChannel(
            name: "multiple-flutters", binaryMessenger: engine!.binaryMessenger)
        channel!.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
            if self.delegate != nil {
                self.delegate?.callMethods(vc: self, funtionName: call.method, params: result)
            }
        }
        
       
        // Do any additional setup after loading the view.
    }

    private var channel: FlutterMethodChannel?

    init(withEntrypoint entryPoint: String?) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let newEngine = appDelegate.engines.makeEngine(withEntrypoint: entryPoint, libraryURI: nil)
        GeneratedPluginRegistrant.register(with: newEngine)
        
        weak var registrar = newEngine.registrar(forPlugin: "hello_world")
        
        let factory = FLNativeViewFactory(messenger: registrar!.messenger())

        registrar!.register(
            factory,
            withId: "platform_text_view")
        
        super.init(engine: newEngine, nibName: nil, bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
