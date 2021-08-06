//
//  TableVC.swift
//  Info
//
//  Created by Max Polinkovsky on 23.07.21.
//

import UIKit

extension ApplicationFormVC: UITableViewDelegate{}

extension ApplicationFormVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ChildCell.self), for: indexPath) as? ChildCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.backgroundColor = .lightGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
            self.childsArray.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.setupButton()
            complete(true)
        }
        
        deleteAction.backgroundColor = .red
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UIContextualAction]? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _,_  in
            self.childsArray.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = .red
        return [deleteAction]
    }
}

extension ApplicationFormVC {
        func makeTableHeaderView() {
            let headerTableView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60))
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.alpha = 0.5
            label.text = header
            label.font = sys20reg
            tableView.tableHeaderView = headerTableView
            headerTableView.addSubview(label)
            headerTableView.addSubview(addChildButton)
            label.heightAnchor.constraint(equalToConstant: 22).isActive = true
            label.centerYAnchor.constraint(equalTo: headerTableView.centerYAnchor).isActive = true
            label.leftAnchor.constraint(equalTo: headerTableView.leftAnchor, constant: 27).isActive = true
            addChildButton.leftAnchor.constraint(equalTo: label.rightAnchor, constant: 10).isActive = true
            addChildButton.centerYAnchor.constraint(equalTo: label.centerYAnchor, constant: 0).isActive = true
            tableView.tableHeaderView = headerTableView
            tableView.rowHeight = 54
    }
}
