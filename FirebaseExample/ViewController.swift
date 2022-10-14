//
//  ViewController.swift
//  FirebaseExample
//
//  Created by Junhee Yoon on 2022/10/05.
//

import UIKit
import FirebaseAnalytics

class ViewController: UIViewController {
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        firebaseAnalytics()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController ViewWillAppear")
    }
    
    
    // MARK: - Helper Functions
    
    func firebaseAnalytics() {
        Analytics.logEvent("mynickname", parameters: [
            "name": "고래봅",
            "full_text": "할로우~ 방가방가",
        ])
        
        Analytics.setDefaultEventParameters([
          "level_name": "Caverns01",
          "level_difficulty": 4
        ])
    }
    
    
    // MARK: - IBActions
    
    @IBAction func profileButtonClicked(_ sender: UIButton) {
        present(ProfileViewController(), animated: true)
    }
    
    @IBAction func settingButtonClicked(_ sender: UIButton) {
        navigationController?.pushViewController(SettingViewController(), animated: true)
    }
    
    @IBAction func crashButtonClicked(_ sender: UIButton) {
    }
}


class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ProfileViewController ViewWillAppear")
    }
    
}


class SettingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBrown
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SettingViewController ViewWillAppear")
    }
    
}


// MARK: - Extension: 최상위 뷰컨트롤러 판단

extension UIViewController {
    
    var topViewController: UIViewController? {
        return self.topViewController(currentViewController: self)
    }
    
    func topViewController(currentViewController: UIViewController) -> UIViewController {
        
        if let tabBarController = currentViewController as? UITabBarController, let selectedViewController = tabBarController.selectedViewController {
            
            return self.topViewController(currentViewController: selectedViewController)
            
        } else if let navigationController = currentViewController as? UINavigationController, let visibleViewController = navigationController.visibleViewController {
            
            return self.topViewController(currentViewController: visibleViewController)
            
        } else if let presentedViewController = currentViewController.presentedViewController {
            
            return self.topViewController(currentViewController: presentedViewController)
            
        } else {
            return currentViewController
        }
        
    }
    
}


// MARK: - Extension: Swizzling

extension UIViewController {
    
    class func swizzleMethod() {
        
        let origin = #selector(viewWillAppear)
        let change = #selector(changeViewWillAppear)
        
        guard let originMethod = class_getInstanceMethod(UIViewController.self, origin), let changeMethod = class_getInstanceMethod(UIViewController.self, change) else {
            print("함수를 찾을 수 없거나 오류 발생")
            return
        }
        
        method_exchangeImplementations(originMethod, changeMethod)
        
    }
    
    @objc func changeViewWillAppear() {
        print("Change ViewWillAppear Succeed")
    }
    
}
