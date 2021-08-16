//
//  ChildCellPresentable.swift
//  Info
//
//  Created by Max Polinkovsky on 23.07.21.
//

extension ChildCell: Presentable {
    
    func addSubView() {
        contentView.addSubview(textFieldsStack)
        createStack()
    }
    
    func makeConstraints() {
       setupLayout()
    }
    
    private func createStack() {
        textFieldsStack.addArrangedSubview(nameTextField)
        textFieldsStack.addArrangedSubview(ageTextField)
    }
    
    private func setupLayout() {
        textFieldsStack.snp.makeConstraints {
            $0.top.equalToSuperview().inset(2)
            $0.left.right.equalToSuperview().inset(2)
            $0.bottom.equalToSuperview().inset(2)
        }
    }
}
