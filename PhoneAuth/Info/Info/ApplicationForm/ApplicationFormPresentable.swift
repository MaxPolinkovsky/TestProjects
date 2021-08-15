//
//  ApplicationFormPresentable.swift
//  Info
//
//  Created by Max Polinkovsky on 23.07.21.
//
import UIKit
import SnapKit

extension ApplicationFormVC: Presentable {
    
    func addSubView() {
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(nameHorizontalStack)
        createStack()
        view.addSubview(tableView)
    }
    
    func makeConstraints() {
        setupLayout()
    }
    
    private func setupLayout() {
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        nameHorizontalStack.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).inset(-30)
            $0.left.right.equalToSuperview().inset(20)
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(nameHorizontalStack.snp.bottom).inset(-50)
            $0.bottom.equalToSuperview()
            $0.left.right.equalToSuperview().inset(20)
        }
    }
    
    func createStack() {
        nameHorizontalStack.addArrangedSubview(nameTextField)
        nameHorizontalStack.addArrangedSubview(ageTextField)
    }
}
