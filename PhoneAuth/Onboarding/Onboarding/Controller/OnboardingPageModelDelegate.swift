//
//  OnboardingPageModelDelegateFlowLayout.swift
//  Onboarding
//
//  Created by Max Polinkovsky on 12.07.21.
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
    }
    

    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    fileprivate func cellSetup(_ indexPath: IndexPath, _ cell: OnboardingPageCell) {
        currentPage = indexPath.row
//        progress()
        setupBackground(cell)
        let page = pages[indexPath.row]
        cell.imageView.image = UIImage(named: page.image)
        cell.nameLabel.text = page.label
        cell.pageLabelText.text = page.text
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! OnboardingPageCell
        cellSetup(indexPath, cell)
        
        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width

        pageControl.setPage(Int(round(offSet / width)))
        
    }

    
    
    func setupBackground(_ cell: OnboardingPageCell) {
        switch currentPage {
        case 0:
            collectionView.backgroundColor = .white
            cell.nameLabel.textColor = black
        case 1:
            collectionView.backgroundColor = .white
            cell.nameLabel.textColor = black
        case 2:
            collectionView.backgroundColor = darkModeBack
            cell.nameLabel.textColor = gray
        default:
            break
        }
    }
}
