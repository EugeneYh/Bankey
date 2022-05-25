//
//  ViewController.swift
//  Bankey
//
//  Created by Eugene Yehanovskiy on 19.05.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        style()
        layout()
    }
}

extension LoginViewController {
    fileprivate func style() {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func layout() {
        view.addSubview(loginView)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
    }
}

