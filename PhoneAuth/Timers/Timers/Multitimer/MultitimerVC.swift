//
//  MultitimerVC.swift
//  Timers
//
//  Created by Max Polinkovsky on 04.07.21.
//

import UIKit
import Then

class MultitimerVC: UIViewController {
    
    var taskList: [Task] = []
    var startTime = 0.0
    
    lazy var headerLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alpha = 0.5
        $0.text = timers
        $0.textColor = .black
        $0.font = sys20reg
    }

    lazy var addTimersLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .left
        $0.font = sys20bold
        $0.text = addTimers
        $0.textColor = .gray
    }

    lazy var timerNameTF = UITextField().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .left
        $0.borderStyle = .roundedRect
        $0.returnKeyType = .next
        $0.autocorrectionType = .yes
        $0.spellCheckingType = .yes
        $0.font = sys20reg
        $0.placeholder = addTimerName
        $0.clearButtonMode = .whileEditing
        $0.clearsOnBeginEditing = true
        $0.layer.masksToBounds = true
    }
    
    lazy var secondsTF = UITextField().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .left
        $0.borderStyle = .roundedRect
        $0.returnKeyType = .next
        $0.autocorrectionType = .yes
        $0.spellCheckingType = .yes
        $0.keyboardType = .numberPad
        $0.placeholder = addTimeInSeconds
        $0.font = sys20reg
        $0.clearButtonMode = .whileEditing
        $0.clearsOnBeginEditing = true
        $0.layer.masksToBounds = true
    }
    
    lazy var tFStack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = 20
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.alignment = .fill
        $0.contentMode = .left
        $0.addArrangedSubview(timerNameTF)
        $0.addArrangedSubview(secondsTF)
    }
    
    lazy var addTimerButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 12
        $0.setTitle(add, for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.setTitleColor(.gray, for: .highlighted)
        $0.titleLabel?.font = sys20bold
        $0.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    lazy var tableView = UITableView(frame: .zero, style: UITableView.Style.plain).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.separatorStyle = .singleLine
        $0.showsVerticalScrollIndicator = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(TimerCell.self, forCellReuseIdentifier: cellID)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        makeTableHeaderView()
        createTimer()
        title = name
    }
}

