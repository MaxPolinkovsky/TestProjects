//
//  PageCell.swift
//  CollectionPages
//
//  Created by Evgeniy Suprun on 10.10.2020.
//

import UIKit
import Then
import SnapKit

class PageCell: UICollectionViewCell {
    
    lazy var imageView = UIImageView().then {
        $0.contentMode = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
 
    lazy var pageLabelText = UILabel().then {
        $0.numberOfLines = 0
        $0.adjustsFontSizeToFitWidth = true
        $0.textColor = black
        $0.minimumScaleFactor = 0.8
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addInSubwiews()
        setupLayout()
    }
    
    private func addInSubwiews() {
        addSubview(imageView)
//        addSubview(pageLabel)
        addSubview(pageLabelText)
    }
    
    func setupImage(constraint: Bool) {
        
        switch constraint {
        case true:
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = constraint
            pageLabelText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 60).isActive = true
        case false:
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 70).isActive = true
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
            imageView.bottomAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            pageLabelText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 60).isActive = true
        }
    }
    
    private func setupLayout() {
        pageLabelText.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pageLabelText.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        pageLabelText.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
    }
    
    func isOtherIphone() {
        
        switch UIDevice().type {
        case .iPhoneSE :
            pageLabelText.font = .systemFont(ofSize: 20, weight: .bold)//UIFont(name: "TeXGyreAdventor-Bold", size: 20)
            NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            ])
        case .iPhone8, .iPhone7, .iPhone6, .iPhone6S :
            pageLabelText.font = .systemFont(ofSize: 24, weight: .bold)//UIFont(name: "TeXGyreAdventor-Bold", size: 24)
            NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            ])
        case .iPhone8Plus, .iPhone7Plus, .iPhone6Plus, .iPhone6SPlus :
            pageLabelText.font = .systemFont(ofSize: 28, weight: .bold)//UIFont(name: "TeXGyreAdventor-Bold", size: 28)
            NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            ])
        case .iPhone12Mini:
            pageLabelText.font = .systemFont(ofSize: 28, weight: .bold)//UIFont(name: "TeXGyreAdventor-Bold", size: 28)
            NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            pageLabelText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40)
            ])
        case .iPhoneSE2:
            pageLabelText.font = .systemFont(ofSize: 24, weight: .bold)//UIFont(name: "TeXGyreAdventor-Bold", size: 24)
            NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            pageLabelText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40)
            ])
        default:
            pageLabelText.font = .systemFont(ofSize: 28, weight: .bold)//UIFont(name: "TeXGyreAdventor-Bold", size: 28)
            NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
//            pageLabelText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40)
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
