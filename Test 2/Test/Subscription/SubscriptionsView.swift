//
//  SubscriptionsView.swift
//  learnde
//
//  Created by Max Polinkovsky on 02.04.21.
//  Copyright © 2021 Max Polinkovsky. All rights reserved.
//

import UIKit

struct Product {
    let periodText: String
    let periodValue: Int
    let priceValue: Double
    let priceSimbol: String
    let productId: String
}

final class SubscriptionsView: UIView {
    
    var currentProductId = ""
    
    let month1View = SubscriptionView()
    let yearView = SubscriptionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupDataForViews(products: [Product]) {
        for index in 0..<products.count {
            let price = products[index].priceValue
            let value = (String(format: "%.2f", price))
            switch index {
            case 0:
                month1View.priceLabel.text = "Monthly - " + products[index].priceSimbol  + " " +  "\(value) " + "/" + "\("month")"
                month1View.trialLabel.text = "\(products[index].priceSimbol)" + " " + "\(value) " + "/" + " \("month")"
                month1View.productId = products[index].productId
                month1View.index = 0
            case 1:
                yearView.priceLabel.text = "Annually - " + products[index].priceSimbol + " " + "\(value) " + "/" + "\("year")"
                yearView.trialLabel.text = "\(products[index].priceSimbol)" + " " + "\(String(format: "%.2f", (products[index].priceValue / 12)))" + " /" + " \("month")"
                yearView.productId = products[index].productId
                yearView.badgeView.image = UIImage(named: "badge")
                yearView.index = 1
            default:
                print("Лишний продукт )")
            }
        }
    }
    
    func updateView(with view: SubscriptionView) {
        currentProductId = view.productId
        
        switch view {
        case month1View:
            yearView.isActive = false //updateView(isActive: false)
        case yearView:
            month1View.isActive = false //updateView(isActive: true)
        default:
            break
        }
    }
    
    func deactivateView(is value: Bool) {
        if value {
            yearView.isActive = value
            month1View.isActive = false
        } else {
            month1View.isActive = value
            yearView.isActive = value
        }
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        month1View.delegate = self
        yearView.delegate = self
        
        addSubview(month1View)
        addSubview(yearView)

        month1View.isActive = false
        yearView.isActive = true
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            yearView.topAnchor.constraint(equalTo: topAnchor),
            yearView.leadingAnchor.constraint(equalTo: leadingAnchor),
            yearView.trailingAnchor.constraint(equalTo: trailingAnchor),
            yearView.heightAnchor.constraint(equalToConstant: 64),
            month1View.topAnchor.constraint(equalTo: yearView.bottomAnchor, constant: 8),
            month1View.leadingAnchor.constraint(equalTo: leadingAnchor),
            month1View.trailingAnchor.constraint(equalTo: trailingAnchor),
            month1View.heightAnchor.constraint(equalToConstant: 64),
        ])
    }
}

