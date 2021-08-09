//
//  ValuePresentable.swift
//  learnde
//
//  Created by Max Polinkovsky on 19.04.21.
//  Copyright © 2021 Max Polinkovsky. All rights reserved.
//

import UIKit
import SnapKit

extension ValuePropositionVC: Presentable {
    
    func addSubView() {
        view.addSubview(nextButton)
        view.addSubview(pageControl)
    }
    
    func makeConstraints() {
        switch UIDevice().type {
        case .iPhoneSE :
            nextButton.snp.makeConstraints{
                $0.bottom.equalTo(pageControl.snp.top).inset(-15)
                $0.left.right.equalToSuperview().inset(20)
                $0.height.equalTo(56)
            }
            pageControl.snp.makeConstraints{
                $0.bottom.equalToSuperview().inset(15)
                $0.centerX.equalToSuperview()
            }

        case .iPhone8, .iPhone7, .iPhone6, .iPhone6S :
            nextButton.snp.makeConstraints{
                $0.bottom.equalTo(pageControl.snp.top).inset(-15)
                $0.left.right.equalToSuperview().inset(20)
                $0.height.equalTo(56)
            }
            pageControl.snp.makeConstraints{
                $0.bottom.equalToSuperview().inset(30)
                $0.centerX.equalToSuperview()
            }

        case .iPhone8Plus, .iPhone7Plus, .iPhone6Plus, .iPhone6SPlus :
            nextButton.snp.makeConstraints{
                $0.bottom.equalTo(pageControl.snp.top).inset(-15)
                $0.left.right.equalToSuperview().inset(20)
                $0.height.equalTo(56)
            }
            pageControl.snp.makeConstraints{
                $0.bottom.equalToSuperview().inset(30)
                $0.centerX.equalToSuperview()
            }

        case .iPhoneSE2 :
            nextButton.snp.makeConstraints{
                $0.bottom.equalTo(pageControl.snp.top).inset(-15)
                $0.left.right.equalToSuperview().inset(20)
                $0.height.equalTo(56)
            }
            pageControl.snp.makeConstraints{
                $0.bottom.equalToSuperview().inset(30)
                $0.centerX.equalToSuperview()
            }
        default:
            setupLayout()
        }
    }
    
    private func setupLayout() {
        nextButton.snp.makeConstraints{
            $0.bottom.equalTo(pageControl.snp.top).inset(-30)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
        pageControl.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(80)
            $0.centerX.equalToSuperview()
        }
    }
}

