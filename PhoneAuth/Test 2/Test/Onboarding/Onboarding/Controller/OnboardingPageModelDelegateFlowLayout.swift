//
//  UICollectionViewDelegateFlowLayout.swift
//  learnde
//
//  Created by Max Polinkovsky on 05.04.21.
//  Copyright © 2021 Max Polinkovsky. All rights reserved.
//

import UIKit

extension OnboardingVC: UICollectionViewDelegateFlowLayout {
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        //let x = targetContentOffset.pointee.x
    }
    

    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! OnboardingPageCell
        
        if cell.handler == nil {
            cell.setHandler(tmp: activateBtn)
        }
        
        currentPage = indexPath.row
        
        switch currentPage {
        case 0:
            cell.levelStackButtons.alpha = 1
            cell.timeStackButtons.alpha = 0
            nextButton.setTitle("Continue", for: .normal)
        case 1:
            nextButtonIs(enable: false)
            cell.levelStackButtons.alpha = 0
            cell.timeStackButtons.alpha = 1
            nextButton.setTitle("Continue", for: .normal)
        case 2:
            cell.levelStackButtons.alpha = 0
            cell.timeStackButtons.alpha = 0
            progressView.alpha = 0
            nextButton.alpha = 0
            setupAnimation()
        case 3:
            nextButtonIs(enable: true)
            nextButton.alpha = 1
            cell.levelStackButtons.alpha = 0
            cell.timeStackButtons.alpha = 0
            cell.headerImage.alpha = 1
            cell.personalPlanLabel.alpha = 1
            cell.learnWordsLabel.alpha = 1
            cell.wordsPerDay.alpha = 1
            cell.planImage.alpha = 1
            cell.weeksStack.alpha = 1
            cell.todayWordsLabel.alpha = 1
            cell.oneWeekWordsLabel.alpha = 1
            cell.twoWeekWordsLabel.alpha = 1
            cell.threeWeekWordsLabel.alpha = 1
            progressView.alpha = 1
            nextButton.setTitle("Continue", for: .normal)
            nextButton.addTarget(self, action: #selector(toSubscriptions), for: .touchUpInside)
//            cell.showRemoteNotifications()
        default:
            break
        }
        progress()
        
        let page = pages[indexPath.row]
        cell.levelLabel.text = page.pageText
        
        return cell
    }
    
    @objc func toSubscriptions() {
//        let vdc = SubscriptionVC()
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.setMainVC(vc: vdc)
//        self.dismiss(animated: true)
    }
}
