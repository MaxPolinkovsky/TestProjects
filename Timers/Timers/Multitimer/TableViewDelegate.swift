//
//  MultitimerTableView.swift
//  Timers
//
//  Created by Max Polinkovsky on 04.07.21.
//

import UIKit

extension MultitimerVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? TimerCell else {
            return
        }
        cell.updateState()
    }
}

// MARK: - Actions
extension MultitimerVC {
    @objc func presentAlertController(_ sender: UIBarButtonItem) {
        createTimer()
        DispatchQueue.main.async {
            guard let text = self.timerNameTF.text else {return}
            let task = Task(name: text)
            self.taskList.append(task)
            let indexPath = IndexPath(row: self.taskList.count - 1, section: 0)
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: [indexPath], with: .top)
            self.tableView.endUpdates()
        }
    }
}

extension MultitimerVC {
    func makeTableHeaderView() {
        let headerTableView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 20))
        tableView.tableHeaderView = headerTableView
        headerTableView.addSubview(headerLabel)
        tableView.tableHeaderView = headerTableView
        tableView.rowHeight = 56
    }
}

extension MultitimerVC {
    
    @objc func tapped() {
        createTimer()
        //        updateTimer()
        guard let text = timerNameTF.text else {return}
        DispatchQueue.main.async {
            let task = Task(name: text)
            self.taskList.append(task)
            let indexPath = IndexPath(row: self.taskList.count - 1, section: 0)
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: [indexPath], with: .top)
            self.tableView.endUpdates()
            self.tableView.reloadData()
        }
    }
}

// MARK: - Timer
extension MultitimerVC {
    
    func createTimer() {
        var seconds = ""
        seconds = secondsTF.text ?? ""
        startTime = Double(seconds) ?? 0.0
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTime() {
        guard let visibleRowsIndexPaths = tableView.indexPathsForVisibleRows else { return }
        
        for indexPath in visibleRowsIndexPaths {
            if let cell = tableView.cellForRow(at: indexPath) as? TimerCell {
                cell.updateTime(with: startTime)
            }
        }
    }
}
