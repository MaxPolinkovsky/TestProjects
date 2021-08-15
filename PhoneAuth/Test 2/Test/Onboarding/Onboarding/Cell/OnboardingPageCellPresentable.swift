//
//  OnboardingPageCellPresentable.swift
//  Test
//
//  Created by Max Polinkovsky on 07.04.21.
//
import UIKit
import SnapKit

extension OnboardingPageCell: Presentable {
    
    func addSubView() {
        addSubview(levelLabel)
        addSubview(levelStackButtons)
//        addSubview(attStack)
        addSubview(timeStackButtons)
        addSubview(headerImage)
        addSubview(personalPlanLabel)
        addSubview(wordsPerDay)
        addSubview(learnWordsLabel)
        addSubview(planImage)
        addSubview(weeksStack)
        addSubview(todayWordsLabel)
        addSubview(oneWeekWordsLabel)
        addSubview(twoWeekWordsLabel)
        addSubview(threeWeekWordsLabel)
    }
    
    func makeConstraints() {
    
//        ATTButton.snp.makeConstraints {
//            $0.height.equalTo(56)
//        }
//
//        attStack.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.bottom.equalToSuperview().inset(140)
//            $0.right.left.equalToSuperview().inset(24)
//        }
        
        levelLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(94)
            $0.right.left.equalToSuperview().inset(24)
        }

        levelStackButtons.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.right.left.equalToSuperview().inset(24)
            $0.height.equalTo(200)
        }
        
        timeStackButtons.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.right.left.equalToSuperview().inset(24)
            $0.height.equalTo(200)
        }
        
        headerImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview()
        }
        
        personalPlanLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(75)
            $0.left.right.equalToSuperview().inset(25)
        }
        
        learnWordsLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(25)
        }
        
        planImage.snp.makeConstraints {
            $0.top.equalTo(wordsPerDay.snp.bottom).inset(-24)
            $0.left.right.equalToSuperview().inset(24)
        }
        
        weeksStack.snp.makeConstraints {
            $0.top.equalTo(planImage.snp.bottom)
            $0.left.right.equalToSuperview()
            
        }
        
        switch UIDevice().type {
        
        case .iPhoneSE :
            
            levelLabel.font = UIFont(name: bold, size: 18)
            wordsPerDay.font = UIFont(name: bold, size: 14)
            personalPlanLabel.font = UIFont(name: bold, size: 18)
            learnWordsLabel.font = UIFont(name: bold, size: 12)
            headerImage.snp.makeConstraints {
                $0.height.equalTo(200)
            }
            
            learnWordsLabel.snp.makeConstraints {
                $0.top.equalTo(personalPlanLabel.snp.bottom).inset(-10)
            }
            
            wordsPerDay.snp.makeConstraints {
                $0.top.equalTo(headerImage.snp.bottom).inset(-20)
                $0.centerX.equalToSuperview()
            }
            
            todayWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-106)
                $0.left.equalToSuperview().inset(14)
                $0.width.equalTo(34)
            }
            
            oneWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-86)
                $0.left.equalToSuperview().inset(98)
                $0.width.equalTo(34)
            }
            
            twoWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-48)
                $0.right.equalToSuperview().inset(104)
                $0.width.equalTo(34)
            }
            
            threeWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-28)
                $0.right.equalToSuperview().inset(20)
                $0.width.equalTo(34)
            }
            
        case .iPhone8, .iPhone7, .iPhone6, .iPhone6S :
            levelLabel.font = UIFont(name: bold, size: 22)
            
            learnWordsLabel.snp.makeConstraints {
                $0.top.equalTo(personalPlanLabel.snp.bottom).inset(-10)
            }
            
            wordsPerDay.snp.makeConstraints {
                $0.top.equalTo(headerImage.snp.bottom).inset(-20)
                $0.centerX.equalToSuperview()
            }
            
            todayWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-106)
                $0.left.equalToSuperview().inset(14)
                $0.width.equalTo(34)
            }
            
            oneWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-86)
                $0.left.equalToSuperview().inset(116)
                $0.width.equalTo(34)
            }
            
            twoWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-48)
                $0.right.equalToSuperview().inset(124)
                $0.width.equalTo(34)
            }
            
            threeWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-28)
                $0.right.equalToSuperview().inset(22)
                $0.width.equalTo(34)
            }
            
        case .iPhone8Plus, .iPhone7Plus, .iPhone6Plus, .iPhone6SPlus :
            
            levelLabel.font = UIFont(name: bold, size: 22)
            
            learnWordsLabel.snp.makeConstraints {
                $0.top.equalTo(personalPlanLabel.snp.bottom).inset(-20)
            }
            
            wordsPerDay.snp.makeConstraints {
                $0.top.equalTo(headerImage.snp.bottom).inset(-48)
                $0.centerX.equalToSuperview()
            }
            
            todayWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-106)
                $0.left.equalToSuperview().inset(14)
                $0.width.equalTo(34)
            }
            
            oneWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-86)
                $0.left.equalToSuperview().inset(128)
                $0.width.equalTo(34)
            }
            
            twoWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-48)
                $0.right.equalToSuperview().inset(138)
                $0.width.equalTo(34)
            }
            
            threeWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-28)
                $0.right.equalToSuperview().inset(24)
                $0.width.equalTo(34)
            }
        
        case .iPhone12Mini, .iPhoneX:
            
            levelLabel.font = UIFont(name: bold, size: 24)
            
            learnWordsLabel.snp.makeConstraints {
                $0.top.equalTo(personalPlanLabel.snp.bottom).inset(-20)
            }
            
            wordsPerDay.snp.makeConstraints {
                $0.top.equalTo(headerImage.snp.bottom).inset(-48)
                $0.centerX.equalToSuperview()
            }
             
            todayWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-106)
                $0.left.equalToSuperview().inset(14)
                $0.width.equalTo(34)
            }
            
            oneWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-86)
                $0.left.equalToSuperview().inset(116)
                $0.width.equalTo(34)
            }
            
            twoWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-48)
                $0.right.equalToSuperview().inset(124)
                $0.width.equalTo(34)
            }
            
            threeWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-28)
                $0.right.equalToSuperview().inset(22)
                $0.width.equalTo(34)
            }
        case .iPhoneXS:
            
            levelLabel.font = UIFont(name: bold, size: 24)
            wordsPerDay.font = UIFont(name: bold, size: 18)
            personalPlanLabel.font = UIFont(name: bold, size: 18)
            wordsPerDay.snp.makeConstraints {
                $0.top.equalTo(headerImage.snp.bottom).inset(-48)
                $0.centerX.equalToSuperview()
            }
             
            learnWordsLabel.snp.makeConstraints {
                $0.top.equalTo(personalPlanLabel.snp.bottom).inset(-20)
            }
            
            todayWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-106)
                $0.left.equalToSuperview().inset(14)
                $0.width.equalTo(34)
            }
            
            oneWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-86)
                $0.left.equalToSuperview().inset(116)
                $0.width.equalTo(34)
            }
            
            twoWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-48)
                $0.right.equalToSuperview().inset(124)
                $0.width.equalTo(34)
            }
            
            threeWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-28)
                $0.right.equalToSuperview().inset(22)
                $0.width.equalTo(34)
            }
        case .iPhone11:
            
            levelLabel.font = UIFont(name: bold, size: 24)
            
            learnWordsLabel.snp.makeConstraints {
                $0.top.equalTo(personalPlanLabel.snp.bottom).inset(-20)
            }
            
            wordsPerDay.snp.makeConstraints {
                $0.top.equalTo(headerImage.snp.bottom).inset(-48)
                $0.centerX.equalToSuperview()
            }
            
            todayWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-106)
                $0.left.equalToSuperview().inset(14)
                $0.width.equalTo(34)
            }
            
            oneWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-86)
                $0.left.equalToSuperview().inset(128)
                $0.width.equalTo(34)
            }
            
            twoWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-48)
                $0.right.equalToSuperview().inset(138)
                $0.width.equalTo(34)
            }
            
            threeWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-28)
                $0.right.equalToSuperview().inset(24)
                $0.width.equalTo(34)
            }
            
        case .iPhone11Pro:
            
            levelLabel.font = UIFont(name: bold, size: 24)
            
            wordsPerDay.snp.makeConstraints {
                $0.top.equalTo(headerImage.snp.bottom).inset(-48)
                $0.centerX.equalToSuperview()
            }
            
            todayWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-106)
                $0.left.equalToSuperview().inset(14)
                $0.width.equalTo(34)
            }
            
            learnWordsLabel.snp.makeConstraints {
                $0.top.equalTo(personalPlanLabel.snp.bottom).inset(-20)
            }
            
            oneWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-86)
                $0.left.equalToSuperview().inset(116)
                $0.width.equalTo(34)
            }
            
            twoWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-48)
                $0.right.equalToSuperview().inset(124)
                $0.width.equalTo(34)
            }
            
            threeWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-28)
                $0.right.equalToSuperview().inset(24)
                $0.width.equalTo(34)
            }
    
        case .iPhone12 :
            
            levelLabel.font = UIFont(name: bold, size: 24)
            
            wordsPerDay.snp.makeConstraints {
                $0.top.equalTo(headerImage.snp.bottom).inset(-48)
                $0.centerX.equalToSuperview()
            }
            
            learnWordsLabel.snp.makeConstraints {
                $0.top.equalTo(personalPlanLabel.snp.bottom).inset(-20)
            }
            
            todayWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-106)
                $0.left.equalToSuperview().inset(14)
                $0.width.equalTo(34)
            }
            
            oneWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-86)
                $0.left.equalToSuperview().inset(138)
                $0.width.equalTo(34)
            }
            
            twoWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-48)
                $0.right.equalToSuperview().inset(128)
                $0.width.equalTo(34)
            }
            
            threeWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-28)
                $0.right.equalToSuperview().inset(24)
                $0.width.equalTo(34)
            }
            
        case .iPhone12ProMax:
            
            levelLabel.font = UIFont(name: bold, size: 24)
            
            wordsPerDay.snp.makeConstraints {
                $0.top.equalTo(headerImage.snp.bottom).inset(-48)
                $0.centerX.equalToSuperview()
            }
            
            learnWordsLabel.snp.makeConstraints {
                $0.top.equalTo(personalPlanLabel.snp.bottom).inset(-20)
            }
            
            todayWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-106)
                $0.left.equalToSuperview().inset(14)
                $0.width.equalTo(34)
            }
            
            oneWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-86)
                $0.left.equalToSuperview().inset(138)
                $0.width.equalTo(34)
            }
            
            twoWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-48)
                $0.right.equalToSuperview().inset(128)
                $0.width.equalTo(34)
            }
            
            threeWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-28)
                $0.right.equalToSuperview().inset(24)
                $0.width.equalTo(34)
            }
        case .iPhoneSE2:
            
            levelLabel.font = UIFont(name: bold, size: 24)
            
            wordsPerDay.snp.makeConstraints {
                $0.top.equalTo(headerImage.snp.bottom).inset(-20)
                $0.centerX.equalToSuperview()
            }
            
            learnWordsLabel.snp.makeConstraints {
                $0.top.equalTo(personalPlanLabel.snp.bottom).inset(-20)
            }
            
            todayWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-106)
                $0.left.equalToSuperview().inset(14)
                $0.width.equalTo(34)
            }
            
            oneWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-86)
                $0.left.equalToSuperview().inset(116)
                $0.width.equalTo(34)
            }
            
            twoWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-48)
                $0.right.equalToSuperview().inset(124)
                $0.width.equalTo(34)
            }
            
            threeWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-28)
                $0.right.equalToSuperview().inset(22)
                $0.width.equalTo(34)
            }
        case .iPhoneXR:
            levelLabel.font = UIFont(name: bold, size: 24)
            
            wordsPerDay.snp.makeConstraints {
                $0.top.equalTo(headerImage.snp.bottom).inset(-48)
                $0.centerX.equalToSuperview()
            }
            
            learnWordsLabel.snp.makeConstraints {
                $0.top.equalTo(personalPlanLabel.snp.bottom).inset(-20)
            }
            
            todayWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-106)
                $0.left.equalToSuperview().inset(14)
                $0.width.equalTo(34)
            }
            
            oneWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-86)
                $0.left.equalToSuperview().inset(138)
                $0.width.equalTo(34)
            }
            
            twoWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-48)
                $0.right.equalToSuperview().inset(128)
                $0.width.equalTo(34)
            }
            
            threeWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-28)
                $0.right.equalToSuperview().inset(24)
                $0.width.equalTo(34)
            }
            
        case .iPhoneXSMax:
            levelLabel.font = UIFont(name: bold, size: 24)
            wordsPerDay.font = UIFont(name: bold, size: 18)
            personalPlanLabel.font = UIFont(name: bold, size: 24)
            
            headerImage.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.left.right.equalToSuperview()
                $0.height.equalTo(264)
            }
           
            learnWordsLabel.snp.makeConstraints {
                $0.top.equalTo(personalPlanLabel.snp.bottom).inset(-20)
            }
            
            wordsPerDay.snp.makeConstraints {
                $0.top.equalTo(headerImage.snp.bottom).inset(-48)
                $0.centerX.equalToSuperview()
            }
            
            todayWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-106)
                $0.left.equalToSuperview().inset(14)
                $0.width.equalTo(34)
            }
            
            oneWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-86)
                $0.left.equalToSuperview().inset(128)
                $0.width.equalTo(34)
            }
            
            twoWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-48)
                $0.right.equalToSuperview().inset(138)
                $0.width.equalTo(34)
            }
            
            threeWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-28)
                $0.right.equalToSuperview().inset(24)
                $0.width.equalTo(34)
            }
            
        default:
            levelLabel.font = UIFont(name: bold, size: 24)
            wordsPerDay.font = UIFont(name: bold, size: 18)
            personalPlanLabel.font = UIFont(name: bold, size: 24)
            
            wordsPerDay.snp.makeConstraints {
                $0.top.equalTo(headerImage.snp.bottom).inset(-48)
                $0.centerX.equalToSuperview()
            }
            
            learnWordsLabel.snp.makeConstraints {
                $0.top.equalTo(personalPlanLabel.snp.bottom).inset(-20)
            }
            
            todayWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-106)
                $0.left.equalToSuperview().inset(14)
                $0.width.equalTo(34)
            }
            
            oneWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-86)
                $0.left.equalToSuperview().inset(138)
                $0.width.equalTo(34)
            }
            
            twoWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-48)
                $0.right.equalToSuperview().inset(128)
                $0.width.equalTo(34)
            }
            
            threeWeekWordsLabel.snp.makeConstraints {
                $0.top.equalTo(wordsPerDay.snp.bottom).inset(-28)
                $0.right.equalToSuperview().inset(24)
                $0.width.equalTo(34)
            }
        }
    }
}
