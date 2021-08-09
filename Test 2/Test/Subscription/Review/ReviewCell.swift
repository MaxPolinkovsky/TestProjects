//
//  ReviewCell.swift
//  learnde
//
//  Created by Max Polinkovsky on 29.05.21.
//  Copyright © 2021 Max Polinkovsky. All rights reserved.
//

import UIKit
import SnapKit

class ReviewCell: UICollectionViewCell {
    
    lazy var imageView = UIImageView(image: UIImage(named: "stars")).then {
        $0.contentMode = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var reviewTitle = UILabel().then {
        $0.text = "Create your themes or use predefined"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    lazy var nameTitle: UILabel = {
        let pageText = UILabel()
        pageText.text = "Create your themes or use predefined"
        pageText.font = UIFont(name: regular, size: 16)
        pageText.textColor = veryLightPink
        pageText.numberOfLines = 0
        pageText.textAlignment = .center
        pageText.translatesAutoresizingMaskIntoConstraints = false
        return pageText
    }()
    
    var data: ReviewModel? {
        didSet {
            guard let data = data else { return }
            imageView = UIImageView(image: UIImage(named: data.image))
            reviewTitle.text = data.reviewTitle
            nameTitle.text = data.nameTitle
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(reviewTitle)
        contentView.addSubview(nameTitle)
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(125)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(16)
        }
        
        reviewTitle.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).inset(-16)
            $0.left.right.equalToSuperview()
            $0.centerX.equalToSuperview()
            //            $0.height.equalTo(38)
        }
        
        nameTitle.snp.makeConstraints {
            $0.top.equalTo(reviewTitle.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(20)
        }
        switch UIDevice().type {
        
        case .iPhoneXR:
            imageView.snp.makeConstraints {
                $0.top.equalToSuperview().inset(125)
            }
            
        case .iPhoneX, .iPhone11Pro, .iPhoneXS:
            imageView.snp.makeConstraints {
                $0.top.equalToSuperview().inset(105)
            }

        default:
            imageView.snp.makeConstraints {
                $0.top.equalToSuperview().inset(125)
            }
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
