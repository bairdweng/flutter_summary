//
//  ViewController.swift
//  FlutterGo
//
//  Created by bairdweng on 2023/5/30.
//

import Flutter
import UIKit
class ViewController: UIViewController, FlutterBaseVcDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func clickOnTheShowFlutter(_ sender: Any) {
        let page1 = FlutterBaseViewController(withEntrypoint: nil)
        page1.delegate = self;
        navigationController?.pushViewController(page1, animated: true)
    }

    func callMethods(vc: FlutterBaseViewController?, funtionName: String?, params: Any?) {
        if funtionName == "nextVc" {
            let nextVc = TowViewController()
            navigationController?.pushViewController(nextVc, animated: true)
        }
    }
}
