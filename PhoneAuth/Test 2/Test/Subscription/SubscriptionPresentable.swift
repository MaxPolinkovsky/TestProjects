//
//  Presentable.swift
//  learnde
//
//  Created by Max Polinkovsky on 02.04.21.
//  Copyright © 2021 Max Polinkovsky. All rights reserved.
//

import UIKit
import SnapKit

extension SubscriptionVC: Presentable {
    func addSubView() {
        view.backgroundColor = .white
        view.addSubview(paywallView)
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(closeButton)
        view.addSubview(titleLabel)
        view.addSubview(subscriptionsView)
        view.addSubview(confirmationButton)
        view.addSubview(restorePrivacyButtonsStack)
        view.addSubview(cancelAnyTimeStack)
        view.addSubview(activityIndicator)
    }
    
    func makeConstraints() {
        
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(60)
            $0.left.equalToSuperview().inset(24)
            $0.size.equalTo(32)
        }
 
        collectionView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(40)
            $0.height.equalTo(94)
        }
        
        pageControl.snp.makeConstraints{
            $0.top.equalTo(collectionView.snp.bottom).inset(-16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(8)
        }
        
        subscriptionsView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(-12)
            $0.height.equalTo(120)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        confirmationButton.snp.makeConstraints {
            $0.top.equalTo(subscriptionsView.snp.bottom).inset(-34)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
        
        cancelAnyTimeStack.snp.makeConstraints {
            $0.top.equalTo(confirmationButton.snp.bottom).inset(-20)
            $0.centerX.equalToSuperview()
        }
        
        restorePrivacyButtonsStack.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(35)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(17)
        }
 
        //        restorePurchase.snp.makeConstraints {
        //            $0.top.equalTo(privacyButton.snp.top)
        //            $0.bottom.equalTo(privacyButton.snp.bottom)
        //            $0.right.equalToSuperview().inset(20)
        //            $0.width.equalTo(privacyButton.snp.width)
        //        }
        
        activityIndicator.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.size.equalTo(56)
        }
        
        switch UIDevice().type {
        case .iPhone8, .iPhone7, .iPhone6, .iPhone6S, .iPhoneSE2 :
            titleLabel.font = UIFont(name: bold, size: 28)
            
            paywallView.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.left.right.equalToSuperview()
            }

            collectionView.snp.makeConstraints {
                $0.top.equalTo(paywallView.snp.bottom).inset(-25)
            }
            
            titleLabel.snp.makeConstraints {
                $0.top.equalTo(paywallView.snp.bottom).inset(-30)
                $0.left.right.equalToSuperview().inset(20)
            }
        case .iPhoneSE :
            titleLabel.font = UIFont(name: bold, size: 24)
            
            paywallView.alpha = 0

            titleLabel.snp.makeConstraints {
                $0.top.equalToSuperview().inset(100)
                $0.left.right.equalToSuperview().inset(20)
            }
            
            collectionView.snp.makeConstraints {
                $0.top.equalTo(paywallView.snp.bottom).inset(-25)
            }
            
            
        case .iPhone8Plus, .iPhone7Plus, .iPhone6Plus, .iPhone6SPlus :
            titleLabel.font = UIFont(name: bold, size: 30)

            paywallView.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.left.right.equalToSuperview()
                $0.height.equalTo(264)
            }
 
            collectionView.snp.makeConstraints {
                $0.top.equalTo(paywallView.snp.bottom).inset(-25)
            }
            
            titleLabel.snp.makeConstraints {
                $0.top.equalTo(paywallView.snp.bottom).inset(-80)
                $0.left.right.equalToSuperview().inset(20)
            }
            
        case .iPhoneX:
            titleLabel.font = UIFont(name: bold, size: 28)
            collectionView.alpha = 1
            pageControl.alpha = 1
            
            collectionView.snp.makeConstraints {
                $0.top.equalTo(paywallView.snp.bottom).inset(-56)
            }
            
            paywallView.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.left.right.equalToSuperview()
            }
  
            titleLabel.snp.makeConstraints {
                $0.top.equalTo(pageControl.snp.bottom).inset(-24)
                $0.left.right.equalToSuperview().inset(20)
            }
            
        case .iPhoneXR:
            titleLabel.font = UIFont(name: bold, size: 30)
            
            collectionView.alpha = 1
            pageControl.alpha = 1
            
            paywallView.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.left.right.equalToSuperview()
                $0.height.equalTo(264)
            }
 
            collectionView.snp.makeConstraints {
                $0.top.equalTo(paywallView.snp.bottom).inset(-56)
            }
            
            titleLabel.snp.makeConstraints {
                $0.top.equalTo(pageControl.snp.bottom).inset(-24)
                $0.left.right.equalToSuperview().inset(20)
            }
            
        case .iPhoneXSMax:
            titleLabel.font = UIFont(name: bold, size: 30)
            
            collectionView.alpha = 1
            pageControl.alpha = 1
            
            collectionView.snp.makeConstraints {
                $0.top.equalTo(paywallView.snp.bottom).inset(-56)
            }
            
            paywallView.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.left.right.equalToSuperview()
                $0.height.equalTo(264)
            }
            titleLabel.snp.makeConstraints {
                $0.top.equalTo(pageControl.snp.bottom).inset(-24)
                $0.left.right.equalToSuperview().inset(20)
            }
            
        default:
            titleLabel.font = UIFont(name: bold, size: 30)
            
            collectionView.alpha = 1
            pageControl.alpha = 1
            
            paywallView.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.left.right.equalToSuperview()
            }
            
            collectionView.snp.makeConstraints {
                $0.top.equalTo(paywallView.snp.bottom).inset(-56)
            }
            
            titleLabel.snp.makeConstraints {
                $0.top.equalTo(pageControl.snp.bottom).inset(-20)
                $0.left.right.equalToSuperview().inset(20)
            }
        }
    }
}

extension SubscriptionView: Presentable {
    
    func addSubView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 14
        addTarget(self, action: #selector(tappedView), for: .touchUpInside)
        addSubview(priceLabel)
        addSubview(badgeView)
        addSubview(trialLabel)
    }
    
    func makeConstraints() {
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo:topAnchor, constant: 12),
            priceLabel.heightAnchor.constraint(equalToConstant: 18),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            
            badgeView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            badgeView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            badgeView.heightAnchor.constraint(equalToConstant: 24),
            
            trialLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: -4),
            trialLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            trialLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
        ])
        
        lay.frame = self.layer.bounds
        
        switch UIDevice().type {
        case .iPhoneSE :
            priceLabel.font = .systemFont(ofSize: 12, weight: .medium)
            trialLabel.font = .systemFont(ofSize: 11, weight: .medium)
            NSLayoutConstraint.activate([
                priceLabel.heightAnchor.constraint(equalToConstant: 35),
                trialLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 12),
                trialLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            ])
        case .iPhone8, .iPhone7, .iPhone6, .iPhone6S :
            priceLabel.font = .systemFont(ofSize: 15, weight: .medium)
            trialLabel.font = .systemFont(ofSize: 14, weight: .medium)
            NSLayoutConstraint.activate([
                priceLabel.heightAnchor.constraint(equalToConstant: 40),
                trialLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            ])
        case .iPhone8Plus, .iPhone7Plus, .iPhone6Plus, .iPhone6SPlus :
            priceLabel.font = .systemFont(ofSize: 15, weight: .medium)
            trialLabel.font = .systemFont(ofSize: 14, weight: .medium)
            NSLayoutConstraint.activate([
                priceLabel.heightAnchor.constraint(equalToConstant: 40),
                trialLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            ])
        case .iPhoneX:
            priceLabel.font = .systemFont(ofSize: 15, weight: .medium)
            trialLabel.font = .systemFont(ofSize: 14, weight: .medium)
        default:
            priceLabel.font = .systemFont(ofSize: 16, weight: .medium)
            trialLabel.font = .systemFont(ofSize: 15, weight: .medium)
        }
    }
}
extension PrivacyVC: Presentable {
    
    func addSubView() {
        view.addSubview(closeButton)
        view.addSubview(textView)
    }
    
    func makeConstraints() {
        
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 32),
            closeButton.widthAnchor.constraint(equalToConstant: 32),
            closeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 47),
            
            textView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 10),
            textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            textView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
