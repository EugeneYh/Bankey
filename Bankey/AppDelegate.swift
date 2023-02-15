//
//  AppDelegate.swift
//  Bankey
//
//  Created by Eugene Yehanovskiy on 19.05.2022.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var hasOnboarded = false
    
    let loginViewController = LoginViewController()
    let onboaringViewController = OnboardingContainerViewController()
    let dummyViewController = DummyViewController()
    let mainTabBarController = MainTabBarController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        loginViewController.delegate = self
        onboaringViewController.delegate = self
        dummyViewController.logoutDelegate = self
        
        window?.rootViewController = mainTabBarController
        mainTabBarController.selectedIndex = 1
        
        window?.backgroundColor = .systemBackground
        return true
    }
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil)
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        if hasOnboarded {
            setRootViewController(dummyViewController)
        } else {
            setRootViewController(onboaringViewController)
        }
    }
}

extension AppDelegate: LogoutDelegate {
    func didLogout() {
        setRootViewController(loginViewController)
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        hasOnboarded = true
        setRootViewController(dummyViewController)
    }
}
