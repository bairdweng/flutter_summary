//
//  TowViewController.swift
//  FlutterGo
//
//  Created by bairdweng on 2023/5/30.
//

import Flutter
import SnapKit
import UIKit
class TowViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let testBtn = UIButton(type: .custom)
        testBtn.backgroundColor = .gray
        view.addSubview(testBtn)
        testBtn.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.center.equalTo(view)
        }
        testBtn.addTarget(self, action: #selector(callFlutter), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }

    @objc func callFlutter() {
        FlutterChannelManage.single.callMethods(name: "test", params: ["hello": "你好啊，小香熊"])
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
