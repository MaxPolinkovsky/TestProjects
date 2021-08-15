//
//  OnboardingController.swift
//  Onboarding
//
//  Created by Max Polinkovsky on 12.07.21.
//

import Foundation

extension OnboardingVC {
    
    internal func progress() {
         if progressView.progress != 1 {
             progressView.progress = Float(currentPage + 1)/Float(pages.count)
         } else {
             progressView.progress = 1
         }
     }

     func tapNext() {
         let nextIndex = min(currentPage + 1, pages.count + 1)
         let indexPath  = IndexPath(item: nextIndex, section: 0)
         let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
         let sectionLeftInset = layout.sectionInset.left
         let attri = layout.layoutAttributesForItem(at: indexPath)
         let offset = ((attri?.frame.origin.x)! - sectionLeftInset)
         collectionView.setContentOffset(CGPoint(x: offset, y: 0), animated: false)
     }
     
     @objc func nextButtonTapped() {
         tapNext()
     }
}
