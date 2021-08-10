//
//  ViewController.swift
//  Tabbar
//
//  Created by youzy01 on 2021/5/24.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapAction() {
        print("切换")
        self.tabBarController?.viewControllers?.first?.tabBarItem = UITabBarItem(title: "1234", image: UIImage(named: "icon_sy"), selectedImage: UIImage(named: "icon_sy_x"))
    }
}

