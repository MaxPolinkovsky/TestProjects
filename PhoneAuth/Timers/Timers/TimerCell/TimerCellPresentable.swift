//
//  TimerCellPresentable.swift
//  Timers
//
//  Created by Max Polinkovsky on 04.07.21.
//

import UIKit
import SnapKit

extension TimerCell: Presentable {
    
    func addSubView() {
        addSubview(timerStack)
    }
    
    func makeConstraints() {
        timerStack.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview().inset(2)
        }
    }
}
