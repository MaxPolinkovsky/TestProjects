//
//  Cell.swift
//  Onboarding
//
//  Created by Max Polinkovsky on 12.07.21.
//

import UIKit
import Then

class OnboardingPageCell: UICollectionViewCell {
    
    lazy var imageView = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
 
    lazy var nameLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.font = sfProBold28
    }
    
    lazy var pageLabelText = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.font = sfProReg20
        $0.textColor = lightGray
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

