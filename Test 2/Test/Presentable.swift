//
//  UserPresentable.swift
//  prototypeGV
//
//  Created by admin on 07.12.19.
//  Copyright © 2019 Max Polinkovsky. All rights reserved.
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
