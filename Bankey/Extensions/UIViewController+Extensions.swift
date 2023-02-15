//
//  UIViewController+Extensions.swift
//  Bankey
//
//  Created by Eugene Yehanovskiy on 14.02.2023.
//

import UIKit

extension UIViewController {
    func setStatusBar() {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let statusBarSize = scene.statusBarManager?.statusBarFrame.size else { return }
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusBarView = UIView(frame: frame)
        
        statusBarView.backgroundColor = appColor
        view.addSubview(statusBarView)
    }
    
    func setTabBatImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
