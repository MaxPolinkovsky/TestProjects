//
//  TimerCell.swift
//  Timers
//
//  Created by Max Polinkovsky on 06.07.21.
//

import UIKit

class TimerCell: UITableViewCell {
    
    var timer: Timer?
    
    lazy var taskLabel = UILabel().then {
        $0.adjustsFontSizeToFitWidth = true
        $0.font = sys20reg
        $0.textColor = .black
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    lazy var timeLabel = UILabel().then {
        $0.adjustsFontSizeToFitWidth = true
        $0.font = sys20reg
        $0.textColor = .black
        $0.textAlignment = .right
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var timerStack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = 20
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .fill
        $0.contentMode = .scaleToFill
        $0.addArrangedSubview(taskLabel)
        $0.addArrangedSubview(timeLabel)
    }
    
    var task: Task? {
        didSet {
            taskLabel.text = task?.name
            setState()
        }
    }
    
    func updateState() {
        guard let task = task else {
            return
        }
        task.completed.toggle()
        setState()
    }
    
    func updateTime(with seconds: Double) {
        var seconds = seconds
        guard let task = task else {
            return
        }
        
        if task.completed {
            taskLabel.text = completed
        } else {
            if seconds >= 1 {
                seconds -= 1
                timeLabel.text = String(seconds)
                
                if seconds <= 3 {
                    timeLabel.textColor = .red
                } else {
                    timeLabel.textColor = .blue
                }
                
                if seconds == 0 {
                    cancelTimer()
                }
            }
        }
    }
    
    func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func setState() {
        guard let task = task else {
            return
        }
        if task.completed {
            taskLabel.attributedText = NSAttributedString(string: task.name,
                                                          attributes: [.strikethroughStyle: 1])
        } else {
            taskLabel.attributedText = NSAttributedString(string: task.name,
                                                          attributes: nil)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

