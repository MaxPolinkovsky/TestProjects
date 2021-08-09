//
//  OnboardingVC.swift
//  learnde
//
//  Created by Max Polinkovsky on 05.04.21.
//  Copyright © 2021 Max Polinkovsky. All rights reserved.
//
import UIKit
import Then
import Lottie

enum Time: CGFloat {
    case start = 0
    case finish = 179
}

class OnboardingVC: UICollectionViewController {
    
    var animationView = AnimationView()
    let pages = OnboardingPages.shared.pages
    var cell = OnboardingPageCell()
    var currentPage = 0
    
    lazy var progressView = UIProgressView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.progress = 0.0
        $0.layer.cornerRadius = 10
        $0.backgroundColor = veryLightPinkTwo
        $0.progressTintColor = yellow
        $0.contentMode = .scaleToFill
    }
    
    var nextButton = UIButton().then {
        $0.backgroundColor = clearGray
        $0.layer.cornerRadius = 12
        $0.setTitle("Continue", for: .normal)
        $0.setTitleColor(white, for: .normal)
        $0.setTitleColor(veryLightPink, for: .highlighted)
        $0.titleLabel?.font = UIFont(name: bold, size: 18)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    internal func activateBtn() {
        nextButton.isEnabled = true
        nextButton.backgroundColor = azure
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setup()
        progress()
    }
    
    func setupAnimation() {
        animationView = .init(name: "load")
        animationView.frame = CGRect(x:0, y:0, width:view.bounds.width, height:(0.8 * view.bounds.height))
        animationView.animationSpeed = 0.8
        view.addSubview(animationView)
        animationView.play(fromFrame: Time.start.rawValue, toFrame: Time.finish.rawValue, loopMode: .none) {[weak self] _ in
            self?.tapNext()
        }
    }
    
    func nextButtonIs(enable: Bool) {
        nextButton.isEnabled = enable
        if enable {
            nextButton.backgroundColor = azure
        } else {
            nextButton.backgroundColor = clearGray
        }
    }
    
    private func setupCollectionView() {
        self.navigationController?.navigationBar.isHidden = true
        collectionView.backgroundColor = .white
        self.collectionView.register(OnboardingPageCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = false
    }

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
