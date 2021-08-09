//
//  PageCell.swift
//  learnde
//
//  Created by Max Polinkovsky on 05.04.21.
//  Copyright © 2021 Max Polinkovsky. All rights reserved.
//

import UIKit

class OnboardingPageCell: UICollectionViewCell {
    
//    private let givenName  = KeyChain.string(for: "givenName")
    var week: Week = .current
    var handler: (() -> Void)! = nil
    var onError: (() -> Void)?
    var words = 0
    
    lazy var levelLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.numberOfLines = 3
        $0.minimumScaleFactor = 16
        $0.adjustsFontSizeToFitWidth = true
        $0.textColor = black
    }
    
    lazy var newToLanguageButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = black10
        $0.layer.cornerRadius = 12
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)//UIFont(name: bold, size: 18)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setTitleColor(black, for: .normal)
        $0.contentHorizontalAlignment = .left
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
        $0.addTarget(self, action: #selector(answerTap), for: .touchUpInside)
        $0.setTitle("I’m new to english", for: .normal)
        $0.tag = Level.base.rawValue
    }
    
    lazy var intermediateButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = black10
        $0.layer.cornerRadius = 12
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setTitleColor(black, for: .normal)
        $0.contentHorizontalAlignment = .left
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
        $0.addTarget(self, action: #selector(answerTap), for: .touchUpInside)
        $0.setTitle("Intermediate", for: .normal)
        $0.tag = Level.intermediate.rawValue
    }
    
    lazy var advancedButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = black10
        $0.layer.cornerRadius = 12
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setTitleColor(black, for: .normal)
        $0.contentHorizontalAlignment = .left
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
        $0.addTarget(self, action: #selector(answerTap), for: .touchUpInside)
        $0.setTitle("Advanced", for: .normal)
        $0.tag = Level.advanced.rawValue
    }
    
    lazy var levelStackButtons = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = 16
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.alignment = .fill
        $0.contentMode = .scaleToFill
        $0.addArrangedSubview(newToLanguageButton)
        $0.addArrangedSubview(intermediateButton)
        $0.addArrangedSubview(advancedButton)
    }
    
    lazy var quarterHour = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = black10
        $0.layer.cornerRadius = 12
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setTitleColor(black, for: .normal)
        $0.contentHorizontalAlignment = .left
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
        $0.addTarget(self, action: #selector(timeAnswerTap), for: .touchUpInside)
        $0.setTitle("15 minutes", for: .normal)
        $0.tag = LearnTime.quarter.rawValue
    }
    
    lazy var halfHour = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = black10
        $0.layer.cornerRadius = 12
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setTitleColor(black, for: .normal)
        $0.contentHorizontalAlignment = .left
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
        $0.addTarget(self, action: #selector(timeAnswerTap), for: .touchUpInside)
        $0.setTitle("30 minutes", for: .normal)
        $0.tag = LearnTime.half.rawValue
    }
    
    lazy var hour = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = black10
        $0.layer.cornerRadius = 12
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setTitleColor(black, for: .normal)
        $0.contentHorizontalAlignment = .left
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
        $0.addTarget(self, action: #selector(timeAnswerTap), for: .touchUpInside)
        $0.setTitle("60 minutes", for: .normal)
        $0.tag = LearnTime.hour.rawValue
    }
    
    lazy var timeStackButtons = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = 16
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.alignment = .fill
        $0.contentMode = .scaleToFill
        $0.addArrangedSubview(quarterHour)
        $0.addArrangedSubview(halfHour)
        $0.addArrangedSubview(hour)
    }
    
//// MARK: --- Personal Plan ----
    
    lazy var planImage = UIImageView(image: UIImage(named: "plan")).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alpha = 0
    }
    
    lazy var headerImage = UIImageView(image: UIImage(named: "header")).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alpha = 0
    }
    
    lazy var personalPlanLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.adjustsFontSizeToFitWidth = true
        $0.textColor = white
        $0.font = UIFont(name: bold, size: 24)
        $0.text = "Jenny" + ", here is\nyour personal plan"
        $0.minimumScaleFactor = 0.6
        $0.textAlignment = .center
        $0.alpha = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var learnWordsLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.adjustsFontSizeToFitWidth = true
        $0.textColor = white
        $0.attributedText = converter()
        $0.minimumScaleFactor = 0.6
        $0.textAlignment = .center
        $0.alpha = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var wordsPerDay = UILabel().then {
        $0.adjustsFontSizeToFitWidth = true
        $0.textColor = black
        $0.font = .systemFont(ofSize: 18, weight: .medium)
        $0.text = "🔥 \(wordsProWeek(week: Week.three) / 21)" + " words per day"
        $0.minimumScaleFactor = 0.6
        $0.textAlignment = .center
        $0.alpha = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    lazy var todayLabel = UILabel().then {
//        $0.numberOfLines = 1
        $0.adjustsFontSizeToFitWidth = true
        $0.backgroundColor = white
        $0.textColor = battleshipGrey
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = "Today"
        $0.minimumScaleFactor = 0.6
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var oneWeekLabel = UILabel().then {
//        $0.numberOfLines = 1
        $0.adjustsFontSizeToFitWidth = true
        $0.backgroundColor = white
        $0.textColor = battleshipGrey
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = setCurrentDate(days: Week.one.description)
        $0.minimumScaleFactor = 0.6
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var twoWeekLabel = UILabel().then {
//        $0.numberOfLines = 1
        $0.adjustsFontSizeToFitWidth = true
        $0.backgroundColor = white
        $0.textColor = battleshipGrey
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = setCurrentDate(days: Week.two.description)
        $0.minimumScaleFactor = 0.6
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var threeWeekLabel = UILabel().then {
//        $0.numberOfLines = 1
        $0.adjustsFontSizeToFitWidth = true
        $0.backgroundColor = white
        $0.textColor = battleshipGrey
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = setCurrentDate(days: Week.three.description)
        $0.minimumScaleFactor = 0.6
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var weeksStack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alpha = 0
        $0.spacing = 0
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
        $0.addArrangedSubview(todayLabel)
        $0.addArrangedSubview(oneWeekLabel)
        $0.addArrangedSubview(twoWeekLabel)
        $0.addArrangedSubview(threeWeekLabel)
    }
    
    lazy var todayWordsLabel = UILabel().then {
        $0.alpha = 0
        $0.adjustsFontSizeToFitWidth = true
        $0.textColor = azure
        $0.font = .systemFont(ofSize: 18, weight: .regular)
        $0.text = "\(wordsProWeek(week: Week.current))"
        $0.minimumScaleFactor = 0.6
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var oneWeekWordsLabel = UILabel().then {
        $0.alpha = 0
        $0.adjustsFontSizeToFitWidth = true
        $0.textColor = azure
        $0.font = .systemFont(ofSize: 18, weight: .regular)
        $0.text = "\(wordsProWeek(week: Week.one))"
        $0.minimumScaleFactor = 0.6
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var twoWeekWordsLabel = UILabel().then {
        $0.alpha = 0
        $0.adjustsFontSizeToFitWidth = true
        $0.textColor = azure
        $0.font = .systemFont(ofSize: 18, weight: .regular)
        $0.text = "\(wordsProWeek(week: Week.two))"
        $0.minimumScaleFactor = 0.6
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var threeWeekWordsLabel = UILabel().then {
        $0.alpha = 0
        $0.adjustsFontSizeToFitWidth = true
        $0.textColor = yellow
        $0.font = .systemFont(ofSize: 18, weight: .regular)
        $0.text = "\(wordsProWeek(week: Week.three))"
        $0.minimumScaleFactor = 0.6
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
