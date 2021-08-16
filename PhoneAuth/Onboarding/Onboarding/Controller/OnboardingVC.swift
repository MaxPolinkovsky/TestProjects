//
//  OnboardingView.swift
//  Onboarding
//
//  Created by Max Polinkovsky on 12.07.21.
//

import UIKit
import Then
import AdvancedPageControl

class OnboardingVC: UICollectionViewController {
    
    let pages = OnboardingPages.shared.pages
    var cell = OnboardingPageCell()
    var currentPage = 0
    var pageControl = AdvancedPageControlView()
    
    lazy var progressView = UIProgressView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.progress = 0.0
        $0.layer.cornerRadius = 2
        $0.backgroundColor = .white
        $0.progressTintColor = lightAzure
        $0.contentMode = .scaleToFill
    }

    var nextButton = UIButton().then {
        $0.backgroundColor = lightAzure
        $0.layer.cornerRadius = 26
        $0.setTitle("Next".localized(), for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.setTitleColor(.white, for: .highlighted)
        $0.titleLabel?.font = sfProSemiBold16
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageControl(pageControl: pageControl)
        setupCollectionView()
        setup()
//        progress()
    }
    private func setupPageControl(pageControl:AdvancedPageControlView?) {
        guard pageControl == self.pageControl else {
            return
        }
    }
    
    private func setupCollectionView() {
        self.navigationController?.navigationBar.isHidden = true
        self.collectionView.register(OnboardingPageCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = false
        pageControl.drawer = ExtendedDotDrawer(numberOfPages: pages.count,
                                               height: 4, width: 16, space: 8, raduis: 2, currentItem: 0, indicatorColor: azure, dotsColor: lightAzure, isBordered: false, borderColor: .clear, borderWidth: 0, indicatorBorderColor: .clear, indicatorBorderWidth: 0)
    }
    
//    internal func progress() {
//         if progressView.progress != 1 {
//             progressView.progress = Float(currentPage + 1)/Float(pages.count)
//         } else {
//             progressView.progress = 1
//         }
//     }

     func tapNext() {
         let nextIndex = min(currentPage + 1, pages.count + 1)
         let indexPath  = IndexPath(item: nextIndex, section: 0)
         let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
         let sectionLeftInset = layout.sectionInset.left
         let attri = layout.layoutAttributesForItem(at: indexPath)
         let offset = ((attri?.frame.origin.x)! - sectionLeftInset)
         collectionView.setContentOffset(CGPoint(x: offset, y: 0), animated: false)
        pageControl.setPage(nextIndex)
     }
     
     @objc func nextButtonTapped() {
         tapNext()
     }
}
