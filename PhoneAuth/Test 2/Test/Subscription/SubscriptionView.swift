//
//  SubscriptionView.swift
//  prototypeGV
//
//  Created by Max Polinkovsky on 02.04.21.
//  Copyright © 2021 Max Polinkovsky. All rights reserved.
//

import UIKit

final class SubscriptionView: UIControl {
    
    weak var delegate: SubscriptionsView?
    weak var subscription: SubscriptionVC?
    
    var productId = ""
    var isActive = false  {
        didSet {
            updateView(isActive: isActive)
        }
    }
    
    var index: Int = 0 {
        didSet {
            lay.name = "border\(index)"
            lay.frame = self.layer.bounds
        }
    }
    
    let lay: CALayer = {
        let l = CALayer()
        l.borderColor = azure.cgColor
        l.borderWidth = 3
        l.cornerRadius = 14
        l.actions = [
            "hidden": NSNull(),
            "onOrderIn": NSNull(),
            "onOrderOut": NSNull(),
            "sublayers": NSNull(),
            "contents": NSNull(),
            "bounds": NSNull(),
            "position": NSNull()
        ]
        return l
    }()

    lazy var badgeView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    lazy var priceLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.textColor = black
        $0.adjustsFontForContentSizeCategory = true
        $0.adjustsFontSizeToFitWidth = true
    }
    
    lazy var trialLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = battleshipGrey
        $0.alpha = 0.5
        $0.textAlignment = .center
    }
    
    lazy var backgroundLabelView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alpha = 1
        $0.layer.cornerRadius = 13
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        makeConstraints()
        lay.frame = self.layer.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(isActive value: Bool) {
        let userCurretChoiceIs = defaults.bool(forKey: "isDarkTheme")
        lay.frame = self.layer.bounds
        if value {
            backgroundColor = userCurretChoiceIs ? white : .clear
            priceLabel.textColor = black85
            priceLabel.alpha = 1
            backgroundLabelView.backgroundColor = azure

            if !(layer.sublayers?.contains(lay) ?? false) {
                self.layer.insertSublayer(lay, at: 1)
                print("\(lay.name ?? "") addSublayer for index: \(index)")
            }
        } else {
            backgroundColor = userCurretChoiceIs ? charcoalGrey : black10
            priceLabel.textColor = userCurretChoiceIs ? white50 : black85
            priceLabel.alpha = 0.5
            backgroundLabelView.backgroundColor = greyishBrown

            if layer.sublayers?.contains(lay) ?? false {
                let ind = self.layer.sublayers!.firstIndex(of: lay)!
                self.layer.sublayers?.remove(at: ind)
                print("\(lay.name ?? "") removeFromSuperlayer for index: \(index)")
            }
        }
    }
 
    @objc func tappedView() {

        if (isActive == false) {
            isActive = true
            delegate?.updateView(with: self)
        } else {
//            subscription?.addSubscription()
        }
    }
}
