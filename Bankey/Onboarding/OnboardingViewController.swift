//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Eugene Yehanovskiy on 08.07.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private var heroImageName: String {
        didSet {
            imageView.image = UIImage(named: heroImageName)
        }
    }
    private var titleText: String {
        didSet {
            label.text = titleText
        }
    }
    
    let label: UILabel = {
        let lb = UILabel()
//        lb.text = "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in 1989."
        lb.numberOfLines = 0
        lb.font = UIFont.preferredFont(forTextStyle: .title3)
        lb.adjustsFontSizeToFitWidth = true
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init(heroImageName: String, titleText: String) {
        self.heroImageName = heroImageName
        self.titleText = titleText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    fileprivate func setupView() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor .constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
    }
}
