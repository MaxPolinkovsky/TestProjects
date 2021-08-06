//
//  ApplicationFormVC.swift
//  Info
//
//  Created by Max Polinkovsky on 23.07.21.
//

import UIKit
import Then

class ApplicationFormVC: UIViewController {
    
    var childsArray = [String]()
   
    lazy var nameLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = sys30bold
        $0.alpha = 0.5
        $0.textAlignment = .left
        $0.text = parentName
    }
    
    lazy var nameTextField = UITextField().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .left
        $0.contentVerticalAlignment = .center
        $0.borderStyle = .roundedRect
        $0.autocorrectionType = .yes
        $0.autocapitalizationType = .none
        $0.smartInsertDeleteType = .yes
        $0.spellCheckingType = .yes
        $0.font = sys20reg
        $0.placeholder = addName
        $0.clearButtonMode = .whileEditing
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        $0.layer.masksToBounds = true
    }
    
    lazy var ageTextField = UITextField().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .left
        $0.contentVerticalAlignment = .center
        $0.borderStyle = .roundedRect
        $0.smartInsertDeleteType = .yes
        $0.spellCheckingType = .yes
        $0.keyboardType = .numberPad
        $0.font = sys20reg
        $0.placeholder = addAge
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        $0.layer.masksToBounds = true
    }
    
    lazy var nameHorizontalStack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 20
    }
    
    lazy var addChildButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: "buttonAdd"), for: .normal)
        $0.addTarget(self, action: #selector(addChilds), for: .touchUpInside)
    }
    
    lazy var headerLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alpha = 0.5
        $0.text = header
        $0.textColor = .black
        $0.font = sys20reg
    }
    
    lazy var tableView = UITableView(frame: .zero, style: UITableView.Style.plain).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(ChildCell.self, forCellReuseIdentifier: String(describing: ChildCell.self))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        makeTableHeaderView()
    }
    
    @objc func addChilds() {
        childsArray.append("")
        if childsArray.count == 0 {
            tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .bottom)
        } else {
            tableView.insertRows(at: [IndexPath(row: self.childsArray.count - 1, section: 0)], with: .bottom)
            choiseHiddenButton()
        }
    }
    
    func setupButton() {
        addChildButton.isHidden = false
    }

    func choiseHiddenButton() {
        switch childsArray.count {
        case 5:
            addChildButton.isHidden = true
        default:
            break
        }
    }
}

