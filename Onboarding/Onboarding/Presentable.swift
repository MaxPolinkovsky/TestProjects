//
//  Presentable.swift
//  Onboarding
//
//  Created by Max Polinkovsky on 12.07.21.
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
