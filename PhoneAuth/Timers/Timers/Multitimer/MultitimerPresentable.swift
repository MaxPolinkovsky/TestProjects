//
//  MultitimerPresentable.swift
//  Timers
//
//  Created by Max Polinkovsky on 04.07.21.
//

import UIKit
import SnapKit

extension MultitimerVC: Presentable {
    
    func addSubView() {
        view.backgroundColor = .white
        view.addSubview(headerLabel)
        view.addSubview(addTimersLabel)
        view.addSubview(tFStack)
        view.addSubview(addTimerButton)
        view.addSubview(tableView)
    }
    
    func makeConstraints() {
        setupLayout()
    }
    
    private func setupLayout() {
        
        headerLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(27)
            $0.height.equalTo(22)
        }
        
        addTimersLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.left.equalToSuperview().inset(20)
        }
        
        tFStack.snp.makeConstraints {
            $0.top.equalTo(addTimersLabel.snp.bottom).inset(-30)
            $0.left.equalToSuperview().inset(20)
            $0.right.equalToSuperview().inset(100)
        }
        
        addTimerButton.snp.makeConstraints {
            $0.top.equalTo(tFStack.snp.bottom).inset(-50)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(addTimerButton.snp.bottom).inset(-50)
            $0.bottom.equalToSuperview()
            $0.left.right.equalToSuperview().inset(20)
        }
    }
}


