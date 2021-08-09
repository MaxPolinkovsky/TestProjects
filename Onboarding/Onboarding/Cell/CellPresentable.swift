//
//  CellPresentable.swift
//  Onboarding
//
//  Created by Max Polinkovsky on 12.07.21.
//

import UIKit
import SnapKit

extension OnboardingPageCell: Presentable {
    
    func addSubView() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(pageLabelText)
    }
    
    func makeConstraints() {
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.right.left.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).inset(-42)
            $0.left.right.equalToSuperview().inset(24)
            $0.height.equalTo(42)
        }
        
        pageLabelText.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).inset(-16)
            $0.left.right.equalToSuperview().inset(24)
        }
    }
}


