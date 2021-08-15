//
//  OnboardingPresentable.swift
//  Test
//
//  Created by Max Polinkovsky on 07.04.21.
//
import UIKit
import SnapKit

extension OnboardingVC: Presentable {
    
    func addSubView() {
        view.addSubview(progressView)
        view.addSubview(nextButton)
    }
    
    func makeConstraints() {
        progressView.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(56)
            make.height.equalTo(6)
        }
        
        nextButton.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(56)
        }
        
        switch UIDevice().type {
        
        case .iPhoneSE :
            nextButton.snp.makeConstraints { make in
                make.bottom.equalToSuperview().inset(20)
            }
        default:
            nextButton.snp.makeConstraints { make in
                make.bottom.equalToSuperview().inset(60)
            }
        }
    }
}
