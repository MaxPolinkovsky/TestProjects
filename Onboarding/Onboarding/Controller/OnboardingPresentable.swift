//
//  OnboardingPresentable.swift
//  Onboarding
//
//  Created by Max Polinkovsky on 12.07.21.
//
import UIKit
import SnapKit

extension OnboardingVC: Presentable {
    
    func addSubView() {
        view.addSubview(pageControl)
//        view.addSubview(progressView)
        view.addSubview(nextButton)
    }
    
    func makeConstraints() {
        
//        progressView.snp.makeConstraints { make in
//            make.left.equalToSuperview().inset(24)
//            make.bottom.equalToSuperview().inset(89)
//            make.height.equalTo(4)
//            make.width.equalTo(96)
//        }
        
        pageControl.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().inset(89)
            make.height.equalTo(4)
            make.width.equalTo(96)
        }
        
        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(65)
            make.right.equalToSuperview().inset(24)
            make.height.equalTo(56)
            make.width.equalTo(114)
        }
    }
}
