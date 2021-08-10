//
//  TabBarViewController.swift
//  Tabbar
//
//  Created by youzy01 on 2021/5/24.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        let arr: [TabBarType] = [.tab1, .tab2, .tab3, .tab4, .tab5, .tab6, .tab7].compactMap { $0 }

        let vcArr = arr.map { (type) -> UIViewController in
            let vc = type.storyboard.instantiateInitialViewController()!
            if type == .tab3 {
                vc.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tabbar_icon"), selectedImage: UIImage(named: "tabbar_icon"))
            } else {
                vc.tabBarItem = UITabBarItem(title: "Tab(\(type.rawValue)", image: nil, selectedImage: nil)
            }
            return vc
        }

        viewControllers = vcArr
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let index = viewControllers?.firstIndex(of: viewController), index == 2 {
            print("将要点击 2")
            let vc = ExampleViewController()
            present(vc, animated: true, completion: nil)
            return false
        }
        return true
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("已经点击 2")
    }
}

enum TabBarType: Int, CaseIterable {
    case tab1 = 1
    case tab2
    case tab3
    case tab4
    case tab5
    case tab6
    case tab7
}

extension TabBarType {
    var storyboard: UIStoryboard {
        switch self {
        case .tab1:
            return UIStoryboard.tab1
        case .tab2:
            return UIStoryboard.tab2
        case .tab3:
            return UIStoryboard.tab3
        case .tab4:
            return UIStoryboard.tab4
        case .tab5:
            return UIStoryboard.tab5
        case .tab6:
            return UIStoryboard.tab6
        case .tab7:
            return UIStoryboard.tab7
        }
    }
}


/// 项目中故事版对象
extension UIStoryboard {
    static let tab1 = UIStoryboard(name: "1", bundle: nil)
    static let tab2 = UIStoryboard(name: "2", bundle: nil)
    static let tab3 = UIStoryboard(name: "3", bundle: nil)
    static let tab4 = UIStoryboard(name: "4", bundle: nil)
    static let tab5 = UIStoryboard(name: "5", bundle: nil)
    static let tab6 = UIStoryboard(name: "6", bundle: nil)
    static let tab7 = UIStoryboard(name: "7", bundle: nil)
}
