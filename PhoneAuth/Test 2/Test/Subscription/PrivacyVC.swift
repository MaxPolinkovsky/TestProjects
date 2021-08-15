//
//  PrivacyVC.swift
//  
//
//  Created by admin on 31.08.20.
//  Copyright © 2020 Max Polinkovsky. All rights reserved.
//

import UIKit
import Then

class PrivacyVC: UIViewController {
    
    lazy var closeButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: "close"), for: .normal)
        $0.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
    }
    
    lazy var textView = UITextView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = privacy
        $0.font = UIFont(name: bold, size: 14)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadDarkTheme()
    }
    
    @objc func cancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func loadDarkTheme() {
        let userCurretChoiceIs = defaults.bool(forKey: "isDarkTheme")
        view.backgroundColor = userCurretChoiceIs ? darkGrey : white
        textView.backgroundColor = userCurretChoiceIs ? darkGrey : white
        textView.textColor = userCurretChoiceIs ? white : black
        closeButton.setImage(UIImage(named: userCurretChoiceIs ? "closeWhite" : "close"), for: .normal)
        closeButton.tintColor = userCurretChoiceIs ? white : black
    }
}
