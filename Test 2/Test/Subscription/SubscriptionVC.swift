//
//  SubscriptionVC.swift
//  prototypeGV
//
//  Created by Max Polinkovsky on 02.04.21.
//  Copyright © 2021 Max Polinkovsky. All rights reserved.
//

import UIKit
//import FirebaseAuth
//import Amplitude
import Then

enum Products: String {
    case oneMonth = "de.mahus.learnDE.oneMonth"
    case oneYear = "de.mahus.learnDE.oneYear"
}

final class SubscriptionVC: UIViewController {
    
//    weak var delegate: CheckThemeUpdate?

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.alpha = 0
        layout.scrollDirection = .horizontal
        cv.register(ReviewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()

    lazy var pageControl = UIPageControl().then {
        $0.alpha = 0
        $0.currentPage = 0
        $0.numberOfPages = ReviewPages.shared.data.count
        $0.currentPageIndicatorTintColor = black
        $0.pageIndicatorTintColor = veryLightPink
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    lazy var paywallView = UIImageView(image: UIImage(named: "paywall")).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
 
    lazy var closeButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: "closeSubscr"), for: .normal)
        $0.backgroundColor = greyFour
//        $0.addTarget(self, action: #selector(closeVC), for: .touchUpInside)
    }
    
    lazy var titleLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 2
        $0.text = reachYourGoal
        $0.textAlignment = .left
        $0.adjustsFontForContentSizeCategory = true
        $0.adjustsFontSizeToFitWidth = true
    }
    
    lazy var subscriptionsView = SubscriptionsView()
    
    lazy var confirmationButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle(confirmation, for: .normal)
        $0.setTitleColor(veryLightPink, for: .highlighted)
        $0.backgroundColor = azure
        $0.titleLabel?.font = UIFont(name: bold, size: 18)
        $0.layer.cornerRadius = 14
//        $0.addTarget(self, action: #selector(addSubscription), for: .touchUpInside)
    }
    
    lazy var activityIndicator = UIActivityIndicatorView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.hidesWhenStopped = true
    }
    
    lazy var shieldlView = UIImageView(image: UIImage(named: "shield")).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var descriptionLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.text = "Secured with iTunes."
        $0.textAlignment = .center
    }
    
    lazy var cancelLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 12, weight: .heavy)
        $0.textColor = azure
        $0.text = "Cancel anytime"
        $0.textAlignment = .center
    }
    
    lazy var securedLabelStack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = 10
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
        $0.alignment = .center
        $0.contentMode = .scaleToFill
        $0.addArrangedSubview(shieldlView)
        $0.addArrangedSubview(descriptionLabel)
    }
    
    lazy var cancelAnyTimeStack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = 0
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.alignment = .fill
        $0.contentMode = .scaleToFill
        $0.addArrangedSubview(securedLabelStack)
        $0.addArrangedSubview(cancelLabel)
    }
    
    lazy var privacyButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle(terms, for: .normal)
        $0.setTitleColor(veryLightPink, for: .highlighted)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        $0.titleLabel?.minimumScaleFactor = 10
        $0.titleLabel?.numberOfLines = 0
        $0.titleLabel?.textAlignment = .center
        $0.titleLabel?.adjustsFontForContentSizeCategory = true
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.addTarget(self, action: #selector(readPrivacy), for: .touchUpInside)
    }
    
    lazy var restorePurchase = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Restore", for: .normal)
        $0.setTitleColor(veryLightPink, for: .highlighted)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        $0.titleLabel?.minimumScaleFactor = 10
        $0.titleLabel?.numberOfLines = 0
        $0.titleLabel?.textAlignment = .center
        $0.titleLabel?.adjustsFontForContentSizeCategory = true
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.addTarget(self, action: #selector(restorePurchases), for: .touchUpInside)
    }
    
    lazy var restorePrivacyButtonsStack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = 10
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
        $0.alignment = .center
        $0.contentMode = .scaleToFill
        $0.addArrangedSubview(privacyButton)
        $0.addArrangedSubview(restorePurchase)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        setupCollectonView()
        
//        Amplitude.instance().logEvent("paywall_viewed")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadDarkTheme()
        subscriptionsView.month1View.subscription = self
        subscriptionsView.yearView.subscription = self
//        subscriptionsView.setupDataForViews(products: IAPManager.shared.productsArray)
//        if  IAPManager.shared.getSubscriptionStatus() {
//            subscriptionsView.deactivateView(is: false)
//            subscriptionsView.isUserInteractionEnabled = false
//            confirmationButton.isHidden = true
//        } else {
//            subscriptionsView.deactivateView(is: true)
//            subscriptionsView.isUserInteractionEnabled = true
//            confirmationButton.isHidden = false
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        subscriptionsView.month1View.isActive = false
        subscriptionsView.yearView.isActive = true
        subscriptionsView.currentProductId = subscriptionsView.yearView.productId
    }

    fileprivate func setupCollectonView() {
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func purchasedButtonIs() {
        let current = defaults.bool(forKey: "subscription")
        restorePurchase.alpha = current ? 0 : 1
    }
    
    func subscriptionPurchased() {
//        defaults.set(IAPManager.shared.getSubscriptionStatus(), forKey: "subscription")
        defaults.synchronize()
        purchasedButtonIs()
    }

    private func loadDarkTheme() {
        let userCurretChoiceIs = defaults.bool(forKey: "isDarkTheme")
        view.backgroundColor = userCurretChoiceIs ? darkGrey : white
        
        titleLabel.textColor = userCurretChoiceIs ? white : black
        descriptionLabel.textColor = userCurretChoiceIs ? white : black
        
        activityIndicator.color = userCurretChoiceIs ? azure : black85
        privacyButton.setTitleColor(userCurretChoiceIs ? white30 : black853, for: .normal)
        restorePurchase.setTitleColor(userCurretChoiceIs ? white30 : black853, for: .normal)
        
    }
    
    @objc private func readPrivacy() {
        let dvc = PrivacyVC()
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
    
    @objc func restorePurchases() {
//        Amplitude.instance().logEvent("purchase_started")
//        activityIndicator.startAnimating()
//
//        IAPManager.shared.restorePurchases(success: {
//            let alert = UIAlertController(title: nil, message: purchaseIsRestored, preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "ОК", style: .destructive, handler: { _ in
//                let dvc = ThemeVC()
//                let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                appDelegate.setMainVC(vc: dvc)
//                self.dismiss(animated: true, completion: nil)
//            })
//            alert.addAction(okAction)
//            self.activityIndicator.stopAnimating()
//            self.present(alert, animated: true, completion: nil)
//            self.purchasedButtonIs()
//            self.subscriptionPurchased()
//            self.delegate?.checkSubscription()
//
//        }) { error in
//            let alert = UIAlertController(title: nil, message: subscriptionCouldtBeRestored, preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//            alert.addAction(okAction)
//            Amplitude.instance().logEvent("purchase_failed")
//            self.activityIndicator.stopAnimating()
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
    
//    @objc private func closeVC() {
//        Amplitude.instance().logEvent("close_button_tapped")
//        let vdc = ThemeVC()
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.setMainVC(vc: vdc)
//        self.dismiss(animated: true)
//    }
    
//    @objc public func addSubscription() {
//            subscription()
//    }
//
//    func subscription() {
//        let product = IAPManager.shared.products?.first { $0.productIdentifier == subscriptionsView.currentProductId }
//
//        guard let productValue = product else { return }
//
//        self.activityIndicator.startAnimating()
//
//        IAPManager.shared.purchaseProduct(product: productValue, success: {
//            //Здесь останавливаем активити
//
//            self.activityIndicator.stopAnimating()
//            //self.dismiss(animated: true, completion: nil)
//
//            let alert = UIAlertController(title: nil, message: subscriptionsDone, preferredStyle: .alert)
//            UIView.animate(withDuration: Animation.duration07, delay: Animation.delay05, animations: {
//                self.confirmationButton.isHidden = true
//                self.subscriptionsView.isUserInteractionEnabled = false
//            })
//            let okAction = UIAlertAction(title: "ОК", style: .destructive, handler: { _ in
//                Amplitude.instance().logEvent("purchase_started")
//                let dvc = ThemeVC()
//                let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                appDelegate.setMainVC(vc: dvc)
//                self.dismiss(animated: true, completion: nil)
//            })
//            alert.addAction(okAction)
//            self.present(alert, animated: true, completion: nil)
//            print("Успешно")
//        }) { error in
//            //Здесь останавливаем активити
//            self.activityIndicator.stopAnimating()
//
//            let alert = UIAlertController(title: nil, message: "Error: \(String(describing: error?.localizedDescription))".localized(), preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "ОК", style: .destructive, handler: { _ in
//                let dvc = ThemeVC()
//                let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                appDelegate.setMainVC(vc: dvc)
//                self.dismiss(animated: true, completion: nil)
//            })
//            alert.addAction(okAction)
//            Amplitude.instance().logEvent("purchase_failed")
//            self.present(alert, animated: true, completion: nil)
//        }
    }
}
