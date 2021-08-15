//
//  TableViewDataSource.swift
//  Timers
//
//  Created by Max Polinkovsky on 06.07.21.
//

import UIKit

extension MultitimerVC: UITableViewDataSource {
  
    func tableView(_ tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
    return taskList.count
  }
  
  func tableView(_ tableView: UITableView,
    cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
    if let cell = cell as? TimerCell {
      cell.task = taskList[indexPath.row]
    }
    return cell
  }
}
