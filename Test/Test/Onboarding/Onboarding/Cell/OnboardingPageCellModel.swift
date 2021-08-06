//
//  OnboardingPageCellModel.swift
//  learnde
//
//  Created by Max Polinkovsky on 21.05.21.
//  Copyright © 2021 Max Polinkovsky. All rights reserved.
//

import UIKit
//import AppTrackingTransparency
//import AdSupport

import Foundation

struct Animation {
    
    static let duration02 = 0.2
    static let duration03 = 0.3
    static let duration04 = 0.4
    static let duration07 = 0.7
    static let duration08 = 0.8
    static let duration12 = 1.2
    static let delay03  = 0.3
    static let delay04  = 0.4
    static let delay05  = 0.5
}

extension OnboardingPageCell {
 
    @objc func answerTap(_ sender: UIButton) -> Int {
        for case let btn as UIButton in levelStackButtons.arrangedSubviews {
            btn.backgroundColor = black10
            btn.setTitleColor(black, for: .normal)
        }
        
        UIView.animate(withDuration: Animation.duration04, delay: Animation.delay03, animations: {
            sender.backgroundColor = yellow
            sender.setTitleColor(white, for: .normal)
        })
        let level = sender.tag
        defaults.setValue(level, forKey: "level")
        handler?()
        return level
    }
    
    @objc func timeAnswerTap(_ sender: UIButton) -> Int {
        for case let btn as UIButton in timeStackButtons.arrangedSubviews {
            btn.backgroundColor = black10
            btn.setTitleColor(black, for: .normal)
        }
        
        UIView.animate(withDuration: Animation.duration04, delay: Animation.delay03, animations: {
            sender.backgroundColor = yellow
            sender.setTitleColor(white, for: .normal)
        })
        let time = sender.tag
        defaults.setValue(time, forKey: "time")
        handler?()
        return time
    }

    func setHandler(tmp: (() -> Void)!) {
        handler = tmp
    }
    
    func setCurrentDate(days: Int) -> String {
        let date = Date()
        let calendar = Calendar.current
        let week = calendar.date(byAdding: .day, value: (+days), to: date)!
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_GB")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMd")
        let currentDate = dateFormatter.string(from: week)
        return currentDate
    }
    
    func wordsProWeek(week: Week) -> Int {
        let time = defaults.object(forKey: "time") as? Int
        let level = defaults.object(forKey: "level") as? Int
        switch week {
        case .current:
            if time == LearnTime.quarter.rawValue, level == Level.base.rawValue {
                words = 5
            }
            if time == LearnTime.half.rawValue, level == Level.base.rawValue {
                words = 7
            }
            if time == LearnTime.hour.rawValue, level == Level.base.rawValue {
                words = 10
            }
            if time == LearnTime.quarter.rawValue, level == Level.intermediate.rawValue {
                words = 7
            }
            if time == LearnTime.half.rawValue, level == Level.intermediate.rawValue {
                words = 12
            }
            if time == LearnTime.hour.rawValue, level == Level.intermediate.rawValue {
                words = 15
            }
            if time == LearnTime.quarter.rawValue, level == Level.advanced.rawValue {
                words = 10
            }
            if time == LearnTime.half.rawValue, level == Level.advanced.rawValue {
                words = 15
            }
            if time == LearnTime.hour.rawValue, level == Level.advanced.rawValue {
                words = 25
            }
            
        case .one:
            if time == LearnTime.quarter.rawValue, level == Level.base.rawValue {
                words = 15
            }
            if time == LearnTime.half.rawValue, level == Level.base.rawValue {
                words = 40
            }
            if time == LearnTime.hour.rawValue, level == Level.base.rawValue {
                words = 50
            }
            if time == LearnTime.quarter.rawValue, level == Level.intermediate.rawValue {
                words = 40
            }
            if time == LearnTime.half.rawValue, level == Level.intermediate.rawValue {
                words = 70
            }
            if time == LearnTime.hour.rawValue, level == Level.intermediate.rawValue {
                words = 75
            }
            if time == LearnTime.quarter.rawValue, level == Level.advanced.rawValue {
                words = 40
            }
            if time == LearnTime.half.rawValue, level == Level.advanced.rawValue {
                words = 60
            }
            if time == LearnTime.hour.rawValue, level == Level.advanced.rawValue {
                words = 110
            }
            
        case .two:
            if time == LearnTime.quarter.rawValue, level == Level.base.rawValue {
                words = 40
            }
            if time == LearnTime.half.rawValue, level == Level.base.rawValue {
                words = 50
            }
            if time == LearnTime.hour.rawValue, level == Level.base.rawValue {
                words = 70
            }
            if time == LearnTime.quarter.rawValue, level == Level.intermediate.rawValue {
                words = 50
            }
            if time == LearnTime.half.rawValue, level == Level.intermediate.rawValue {
                words = 80
            }
            if time == LearnTime.hour.rawValue, level == Level.intermediate.rawValue {
                words = 90
            }
            if time == LearnTime.quarter.rawValue, level == Level.advanced.rawValue {
                words = 70
            }
            if time == LearnTime.half.rawValue, level == Level.advanced.rawValue {
                words = 90
            }
            if time == LearnTime.hour.rawValue, level == Level.advanced.rawValue {
                words = 130
            }
        case .three:
            if time == LearnTime.quarter.rawValue, level == Level.base.rawValue {
                words = 70
            }
            if time == LearnTime.half.rawValue, level == Level.base.rawValue {
                words = 80
            }
            if time == LearnTime.hour.rawValue, level == Level.base.rawValue {
                words = 100
            }
            if time == LearnTime.quarter.rawValue, level == Level.intermediate.rawValue {
                words = 80
            }
            if time == LearnTime.half.rawValue, level == Level.intermediate.rawValue {
                words = 100
            }
            if time == LearnTime.hour.rawValue, level == Level.intermediate.rawValue {
                words = 120
            }
            if time == LearnTime.quarter.rawValue, level == Level.advanced.rawValue {
                words = 100
            }
            if time == LearnTime.half.rawValue, level == Level.advanced.rawValue {
                words = 130
            }
            if time == LearnTime.hour.rawValue, level == Level.advanced.rawValue {
                words = 160
            }
        }
        return words
    }
    
    func converter() -> NSMutableAttributedString {
        let words = " \(words)" + " words"
        let longString = "You will be able to learn" + words + "\nafter first 21 days on this plan"
        let longestWordRange = (longString as NSString).range(of: words)
        let wordsString = NSMutableAttributedString(string: longString, attributes: [NSAttributedString.Key.font : UIFont(name: regular, size: 18)!])
        wordsString.setAttributes([NSAttributedString.Key.font : UIFont(name: bold, size: 18)!, NSAttributedString.Key.foregroundColor : yellow], range: longestWordRange)
        return wordsString
    }
}
