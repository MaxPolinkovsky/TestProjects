//
//  ChildCell.swift
//  Info
//
//  Created by Max Polinkovsky on 23.07.21.
//

import UIKit

final class ChildCell: UITableViewCell, UITextFieldDelegate {
    
    lazy var nameTextField = UITextField().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .left
        $0.contentVerticalAlignment = .center
        $0.borderStyle = .roundedRect
        $0.autocorrectionType = .yes
        $0.autocapitalizationType = .none
        $0.smartInsertDeleteType = .yes
        $0.spellCheckingType = .yes
        $0.font = sys20reg
        $0.text = ""
        $0.placeholder = addName
        $0.clearButtonMode = .whileEditing
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        $0.layer.masksToBounds = true
    }
    
    lazy var ageTextField = UITextField().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .left
        $0.contentVerticalAlignment = .center
        $0.borderStyle = .roundedRect
        $0.smartInsertDeleteType = .yes
        $0.spellCheckingType = .yes
        $0.keyboardType = .numberPad
        $0.font = sys20reg
        $0.text = ""
        $0.placeholder = addAge
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        $0.layer.masksToBounds = true
    }
    
    lazy var textFieldsStack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 10
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

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

