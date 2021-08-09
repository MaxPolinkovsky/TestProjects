//
//  WelcomePresentable.swift
//  Test
//
//  Created by Max Polinkovsky on 06.04.21.
//

import UIKit
import SnapKit

extension WelcomeVC: Presentable {
    
    func addSubView() {
        view.addSubview(welcomeImage)
        view.addSubview(welcomeLabel)
        view.addSubview(askLabel)
        view.addSubview(nextButton)
    }
    
    func makeConstraints() {
        
        switch UIDevice().type {
        case .iPhoneSE :
            welcomeImage.snp.makeConstraints {
                $0.top.equalToSuperview().inset(50)
                $0.centerX.equalToSuperview()
                $0.height.equalTo(76)
                $0.width.equalTo(83)
            }
            welcomeLabel.font = UIFont(name: bold, size: 24)
            welcomeLabel.snp.makeConstraints {
                $0.top.equalTo(welcomeImage.snp.bottom).inset(-15)
                $0.left.right.equalToSuperview().inset(25)
                $0.centerX.equalToSuperview()
                $0.height.equalTo(118)
            }
            askLabel.font = .systemFont(ofSize: 12, weight: .medium)
            askLabel.snp.makeConstraints {
                $0.top.equalTo(welcomeLabel.snp.bottom).inset(-20)
                $0.right.left.equalToSuperview().inset(25)
                //                $0.height.equalTo(118)
            }
            
            nextButton.snp.makeConstraints {
                $0.bottom.equalToSuperview().inset(60)
                $0.right.left.equalToSuperview().inset(20)
                $0.height.equalTo(56)
            }
            
        case .iPhoneSE2 :
            welcomeImage.snp.makeConstraints {
                $0.top.equalToSuperview().inset(110)
                $0.centerX.equalToSuperview()
                $0.height.equalTo(84)
                $0.width.equalTo(92)
            }
            welcomeLabel.font = UIFont(name: bold, size: 28)
            welcomeLabel.snp.makeConstraints {
                $0.top.equalTo(welcomeImage.snp.bottom).inset(-15)
                $0.left.right.equalToSuperview().inset(25)
                $0.centerX.equalToSuperview()
            }
            askLabel.font = .systemFont(ofSize: 16, weight: .medium)//UIFont(name: bold, size: 16)
            askLabel.snp.makeConstraints {
                $0.top.equalTo(welcomeLabel.snp.bottom).inset(-20)
                $0.right.left.equalToSuperview().inset(25)
            }
            
            nextButton.snp.makeConstraints {
                $0.bottom.equalToSuperview().inset(60)
                $0.right.left.equalToSuperview().inset(20)
                $0.height.equalTo(56)
            }
        case .iPhone8, .iPhone7, .iPhone6, .iPhone6S :
            welcomeImage.snp.makeConstraints {
                $0.top.equalToSuperview().inset(90)
                $0.centerX.equalToSuperview()
                $0.height.equalTo(84)
                $0.width.equalTo(92)
            }
            welcomeLabel.font = UIFont(name: bold, size: 28)
            welcomeLabel.snp.makeConstraints {
                $0.top.equalTo(welcomeImage.snp.bottom).inset(-15)
                $0.left.right.equalToSuperview().inset(25)
                $0.centerX.equalToSuperview()
            }
            askLabel.font = .systemFont(ofSize: 16, weight: .medium)
            askLabel.snp.makeConstraints {
                $0.top.equalTo(welcomeLabel.snp.bottom).inset(-20)
                $0.right.left.equalToSuperview().inset(25)
            }
            
            nextButton.snp.makeConstraints {
                $0.bottom.equalToSuperview().inset(60)
                $0.right.left.equalToSuperview().inset(20)
                $0.height.equalTo(56)
            }
        case .iPhone8Plus, .iPhone7Plus, .iPhone6Plus, .iPhone6SPlus :
            welcomeImage.snp.makeConstraints {
                $0.top.equalToSuperview().inset(100)
                $0.centerX.equalToSuperview()
                $0.height.equalTo(105)
                $0.width.equalTo(115)
            }
            welcomeLabel.font = UIFont(name: bold, size: 28)
            welcomeLabel.snp.makeConstraints {
                $0.top.equalTo(welcomeImage.snp.bottom).inset(-15)
                $0.left.right.equalToSuperview().inset(25)
                $0.centerX.equalToSuperview()
            }
            askLabel.font = .systemFont(ofSize: 18, weight: .medium)//UIFont(name: bold, size: 18)
            askLabel.snp.makeConstraints {
                $0.top.equalTo(welcomeLabel.snp.bottom).inset(-20)
                $0.right.left.equalToSuperview().inset(25)
            }
            
            nextButton.snp.makeConstraints {
                $0.bottom.equalToSuperview().inset(60)
                $0.right.left.equalToSuperview().inset(20)
                $0.height.equalTo(56)
            }
        case .iPhone11Pro :
            welcomeImage.snp.makeConstraints {
                $0.top.equalToSuperview().inset(100)
                $0.centerX.equalToSuperview()
                $0.height.equalTo(105)
                $0.width.equalTo(115)
            }
            welcomeLabel.font = UIFont(name: bold, size: 26)
            welcomeLabel.snp.makeConstraints {
                $0.top.equalTo(welcomeImage.snp.bottom).inset(-15)
                $0.left.right.equalToSuperview().inset(25)
                $0.centerX.equalToSuperview()
            }
            askLabel.font = .systemFont(ofSize: 17, weight: .medium)
            askLabel.snp.makeConstraints {
                $0.top.equalTo(welcomeLabel.snp.bottom).inset(-20)
                $0.right.left.equalToSuperview().inset(25)
            }
            
            nextButton.snp.makeConstraints {
                $0.bottom.equalToSuperview().inset(60)
                $0.right.left.equalToSuperview().inset(20)
                $0.height.equalTo(56)
            }
        case .iPhoneX:
        welcomeImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(180)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(105)
            $0.width.equalTo(115)
        }
        welcomeLabel.font = UIFont(name: bold, size: 30)
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(welcomeImage.snp.bottom).inset(-15)
            $0.left.right.equalToSuperview().inset(25)
            $0.centerX.equalToSuperview()
        }
            askLabel.font = .systemFont(ofSize: 20, weight: .medium)
        askLabel.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).inset(-20)
            $0.right.left.equalToSuperview().inset(25)
        }
        
        nextButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(60)
            $0.right.left.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
        default:
            welcomeImage.snp.makeConstraints {
                $0.top.equalToSuperview().inset(180)
                $0.centerX.equalToSuperview()
                $0.height.equalTo(105)
                $0.width.equalTo(115)
            }
            welcomeLabel.font = UIFont(name: bold, size: 30)
            welcomeLabel.snp.makeConstraints {
                $0.top.equalTo(welcomeImage.snp.bottom).inset(-15)
                $0.left.right.equalToSuperview().inset(25)
                $0.centerX.equalToSuperview()
            }
            askLabel.font = .systemFont(ofSize: 18, weight: .medium)
            askLabel.snp.makeConstraints {
                $0.top.equalTo(welcomeLabel.snp.bottom).inset(-20)
                $0.right.left.equalToSuperview().inset(25)
            }
            
            nextButton.snp.makeConstraints{
                $0.bottom.equalToSuperview().inset(60)
                $0.right.left.equalToSuperview().inset(20)
                $0.height.equalTo(56)
            }
        }
    }
}
