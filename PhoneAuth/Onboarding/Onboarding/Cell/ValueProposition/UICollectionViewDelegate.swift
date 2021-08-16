//
//  ExtensionCollectionVCUICollectionViewDelegateFlowLayout.swift
//  learnde
//
//  Created by Max Polinkovsky on 02.04.21.
//  Copyright © 2021 Max Polinkovsky. All rights reserved.
//

import UIKit

extension ValuePropositionVC: UICollectionViewDelegateFlowLayout {
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int( x / view.frame.width)
        if pageControl.currentPage == 0 {
            nextButton.setTitle("Start Learning".localized(), for: .normal)
            pageControl.alpha = 0
        } else if pageControl.currentPage == 3 {
            nextButton.setTitle("Go!".localized(), for: .normal)
            nextButton.addTarget(self, action: #selector(toLogonVC), for: .touchUpInside)
            pageControl.alpha = 1
        } else {
            nextButton.setTitle("Continue".localized(), for: .normal)
            pageControl.alpha = 1
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PageCell
        
        let page = pages[indexPath.row]
        if indexPath.row == 0 {
            cell.pageLabelText.textColor = .white
        }
        cell.isOtherIphone()
        cell.imageView.image = UIImage(named: page.imageName)
        if cell.imageView.image == UIImage(named: "icnEasy") {
            cell.setupImage(constraint: true)
        } else {
            cell.setupImage(constraint: false)
        }
        collectionView.backgroundView = UIImageView(image: UIImage(named: page.imageBackground))
        collectionView.backgroundView?.contentMode = .scaleAspectFill
        cell.pageLabelText.text = page.pageText
        return cell
    }
}

