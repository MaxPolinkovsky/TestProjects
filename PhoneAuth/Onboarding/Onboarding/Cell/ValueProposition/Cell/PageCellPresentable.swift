////
////  PageCellPresentable.swift
////  learnde
////
////  Created by Max Polinkovsky on 19.04.21.
////  Copyright © 2021 Max Polinkovsky. All rights reserved.
////
//
//import UIKit
//import SnapKit
//
//extension PageCell: Presentable {
//    
//    func addSubView() {
//        addSubview(imageView)
//        addSubview(pageLabelText)
//    }
//    
//    func makeConstraints() {
//        switch UIDevice().type {
//        case .iPhoneSE :
//            pageLabelText.font = UIFont(name: "TeXGyreAdventor-Bold", size: 20)
//            imageView.snp.makeConstraints {
//                $0.bottom.centerX.equalToSuperview().inset(15)
//            }
//        case .iPhone8, .iPhone7, .iPhone6, .iPhone6S :
//            pageLabelText.font = UIFont(name: "TeXGyreAdventor-Bold", size: 28)
//            imageView.snp.makeConstraints {
//                $0.bottom.centerX.equalToSuperview().inset(15)
//            }
//        case .iPhone8Plus, .iPhone7Plus, .iPhone6Plus, .iPhone6SPlus :
//            pageLabelText.font = UIFont(name: "TeXGyreAdventor-Bold", size: 30)
//            imageView.snp.makeConstraints {
//                $0.bottom.centerX.equalToSuperview().inset(15)
//            }
//        default:
//            pageLabelText.font = UIFont(name: "TeXGyreAdventor-Bold", size: 32)
//            imageView.snp.makeConstraints {
//                $0.bottom.centerX.equalToSuperview().inset(30)
//            }
//        }
//    }
//    
////    func setupLayout() {
////        pageLabelText.snp.makeConstraints{
////            $0.centerX.equalToSuperview()
////            $0.left.right.equalToSuperview().inset(20)
////        }
////    }
//}
