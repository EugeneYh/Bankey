//
//  ViewController.swift
//  Bankey
//
//  Created by Eugene Yehanovskiy on 19.05.2022.
//

import UIKit

protocol LogoutDelegate: AnyObject {
    func didLogout()
}

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {
    
    weak var delegate: LoginViewControllerDelegate?
    
    let loginView = LoginView()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bankey"
        label.font = UIFont.systemFont(ofSize: 36, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let signInButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.configuration = .filled()
        btn.configuration?.imagePadding = 8 // for indicator spacing
        btn.setTitle("Sign In", for: .normal)
        return btn
    }()
    
    let errorTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemRed
        label.text = "Error message"
        label.isHidden = true
        return label
    }()
    
    private var username: String? {
        return loginView.userNameTextField.text
    }
    
    private var password: String? {
        return loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        style()
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
        loginView.userNameTextField.text = ""
        loginView.passwordTextField.text = ""
    }
}

extension LoginViewController {
    fileprivate func style() {
        view.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
    }
    
    fileprivate func layout() {
        view.addSubview(loginView)
        view.addSubview(titleLabel)
        view.addSubview(signInButton)
        view.addSubview(errorTextLabel)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        //Mark: Sign In button layout
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //M
        NSLayoutConstraint.activate([
            errorTextLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorTextLabel.centerXAnchor.constraint(equalTo: signInButton.centerXAnchor)
        ])
        
    }
}

extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorTextLabel.isHidden = true
        guard let username = username, let password = password else {
            assertionFailure("The username and pass shouldn't be nill")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "The username / password shouldn't be empty")
            return
        }
        
        if username == " " && password == " " {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
    
    }
    
    private func configureView(withMessage message: String) {
        errorTextLabel.isHidden = false
        errorTextLabel.text = message
    }
}

