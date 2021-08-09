//
//  WelcomeVC.swift
//  learnde
//
//  Created by Max Polinkovsky on 05.04.21.
//  Copyright © 2021 Max Polinkovsky. All rights reserved.
//

import UIKit
import Then

class WelcomeVC: UIViewController {
    
    // формируем имя пользователя на основе авторизационных данных
//    lazy var firstName:String = {
//        var userName   = [String]()
        
//        let givenName  = KeyChain.string(for: "givenName")
//        let familyName = KeyChain.string(for: "familyName")
        
//        if givenName.count > 0 {
//            userName.append(givenName)
//        }
        
//        if familyName.count > 0 {
//            userName.append(familyName)
//        }
//
//        if userName.isEmpty {
//            userName.append("User")
//        }
//        return userName.joined(separator: " ")
//    }()
    
    lazy var welcomeImage = UIImageView(image: UIImage(named: "hello")).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var welcomeLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.minimumScaleFactor = 26
        $0.adjustsFontSizeToFitWidth = true
        $0.text = "Nice to meet you," + "\n Jenny!"
        $0.numberOfLines = 3
        $0.textColor = white
    }
    
    lazy var askLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.minimumScaleFactor = 10
        $0.adjustsFontSizeToFitWidth = true
        $0.text = "To boost your results\nwith personal recommendations,\nwe will ask you a few questions"
        $0.numberOfLines = 5
        $0.textColor = white
    }
    
    lazy var nextButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = white
        $0.layer.cornerRadius = 12
        $0.setTitle("Continue", for: .normal)
        $0.setTitleColor(azure, for: .normal)
        $0.setTitleColor(veryLightPink, for: .highlighted)
        $0.titleLabel?.font = UIFont(name: bold, size: 18)
        $0.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = azure
        self.navigationController?.navigationBar.isHidden = true
        setup()
    }
    
    @objc func nextButtonTapped() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let dvc = OnboardingVC(collectionViewLayout: layout)
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
}
