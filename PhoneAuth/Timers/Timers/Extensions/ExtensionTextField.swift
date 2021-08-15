//
//  ExtensionTextField.swift
//  Timers
//
//  Created by Max Polinkovsky on 04.07.21.
//

import UIKit

extension UITextField {
    @IBInspectable var textInsets: CGPoint {
        get {
            return CGPoint.zero
        }
        set {
            layer.sublayerTransform = CATransform3DMakeTranslation(newValue.x, newValue.y, 0);
        }
    }
}
