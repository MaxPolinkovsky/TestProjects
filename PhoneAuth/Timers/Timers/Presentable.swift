//
//  Presentable.swift
//  Timers
//
//  Created by Max Polinkovsky on 04.07.21.
//

import UIKit

protocol Presentable: AnyObject {
    
    func addSubView()
    func makeConstraints()
}

extension Presentable {
    
    func setup() {
        addSubView()
        makeConstraints()
    }
}
